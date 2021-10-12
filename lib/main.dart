import 'package:flutter/material.dart';
import 'package:projetoflutter/core/login/controller/login_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'components/temas/tema_padrao.dart';
import 'core/login/page/login_page.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: TemaPadrao.get(),
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      home: LoginPage(
        controller: locator<LoginController>(),
      ),
    );
  }
}
