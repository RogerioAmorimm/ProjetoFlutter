import 'package:get_it/get_it.dart';
import 'package:projetoflutter/core/login/controller/login_controller.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';

final locator = GetIt.instance;
void setUpLocator() {
  locator.registerSingleton<UsuarioController>(UsuarioController());
  locator.registerSingleton<LoginController>(LoginController());
}
