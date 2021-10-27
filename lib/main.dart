// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projetoflutter/core/login/page/login_page.dart';
import 'package:projetoflutter/core/usuario/entity/usuario_entity.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/splash_screen.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/routers/routers.dart';
import 'package:projetoflutter/utils/sharedPreference/shared_preferences_util.dart';
import 'components/temas/tema_padrao.dart';
import 'core/login/page/login_page.dart';
import 'core/usuario/controller/usuario_controller.dart';

Future main() async {
  String rotaInicial = LoginPage.routeName;
  await dotenv.load(fileName: '.env');
  setUpLocator();
  if (await UsuarioEntity.ehUsuarioLogadoLocalmente()) {
    await locator<UsuarioController>().setUsuarioLogado(
      UsuarioEntity(
        token: await SharedPreferenceUtil.getString(Constants.spToken),
        id: await SharedPreferenceUtil.getString(Constants.spId),
        senha: await SharedPreferenceUtil.getString(Constants.spSenha),
        email: await SharedPreferenceUtil.getString(Constants.spEmail),
        nome: await SharedPreferenceUtil.getString(Constants.spNome),
      ),
    );
    rotaInicial = SplashScreen.routerName;
  }
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    rotaInicial: rotaInicial,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({@required this.rotaInicial, Key key}) : super(key: key);
  final String rotaInicial;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: TemaPadrao.get(),
      routes: Routers.getAll(),
      initialRoute: rotaInicial,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
    );
  }
}
