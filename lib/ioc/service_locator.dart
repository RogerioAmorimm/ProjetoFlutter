import 'package:get_it/get_it.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/core/login/controller/login_controller.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/modulos/home/controller/home_controller.dart';
import 'package:projetoflutter/modulos/listaItens/service/card_service.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';

final locator = GetIt.instance;
void setUpLocator() {
  locator.registerSingleton<UsuarioController>(UsuarioController());
  locator.registerSingleton<LoginController>(LoginController());
  locator.registerSingleton<DrawerNavegacaoController>(
      DrawerNavegacaoController());
  locator.registerSingleton<HomeController>(HomeController());
  locator.registerSingleton<CardService>(CardService());
  locator.registerSingleton<CardStore>(CardStore());
}
