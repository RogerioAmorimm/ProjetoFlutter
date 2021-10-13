import 'package:flutter/material.dart';
import 'package:projetoflutter/core/login/page/login_page.dart';

class FadePageRoute<T> extends MaterialPageRoute<T> {
  FadePageRoute({
    required WidgetBuilder builder,
    required RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      settings.name == LoginPage.routeName
          ? child
          : FadeTransition(
              opacity: animation,
              child: child,
            );
}
