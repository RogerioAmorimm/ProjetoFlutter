import 'package:flutter/material.dart';
import 'package:projetoflutter/components/fade_in.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarComponente {
  static Future<bool> goToLogin(BuildContext context) async => true;
  AppBar buildAppBar(
      GlobalKey<ScaffoldState> key,
      ThemeData tema,
      BuildContext context,
      dynamic loadingController,
      dynamic headerAniInterval) {
    final Widget botaoVoltar = IconButton(
        color: Constants.primaria,
        icon: Icon(FontAwesomeIcons.bars),
        onPressed: () => key.currentState!.openDrawer());

    final botaoSair = IconButton(
        color: Constants.primaria,
        icon: Icon(FontAwesomeIcons.signOutAlt),
        onPressed: () => goToLogin(context));

    final titulo = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Hero(
              tag: "TAG AQUI",
              child: Image.asset(
                "IMG AQUI",
                filterQuality: FilterQuality.high,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );

    return AppBar(
      leading: FadeIn(
        child: botaoVoltar,
        offset: .3,
        curve: headerAniInterval,
        fadeDirection: FadeDirection.startToEnd,
      ),
      actions: [
        FadeIn(
            child: botaoSair,
            offset: .3,
            curve: headerAniInterval,
            fadeDirection: FadeDirection.endToStart)
      ],
      title: titulo,
      backgroundColor: Constants.primaria,
      elevation: 0,
    );
  }
}
