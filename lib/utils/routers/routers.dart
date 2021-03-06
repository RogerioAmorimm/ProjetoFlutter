
import 'package:flutter/cupertino.dart';
import 'package:projetoflutter/core/login/controller/login_controller.dart';
import 'package:projetoflutter/core/login/page/login_page.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/splash_screen.dart';

mixin Routers {
  static Map<String, WidgetBuilder> getAll() => {
        LoginPage.routeName: (context) => LoginPage(
              controller: locator<LoginController>(),
            ),
        SplashScreen.routerName: (context) => SplashScreen()
      };
}
