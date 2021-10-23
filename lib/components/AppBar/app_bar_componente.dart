import 'package:flutter/material.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/components/fade_in.dart';
import 'package:projetoflutter/core/login/controller/login_controller.dart';
import 'package:projetoflutter/core/login/page/login_page.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarComponente {
  static Future<bool> goToLogin(BuildContext context) async {
    await locator<UsuarioController>().getUsuarioLogado()!.limparToken();
    locator<DrawerNavegacaoController>().limpar();
    locator<CardStore>().limpar();
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            LoginPage(controller: LoginController()),
      ),
      (Route route) => false,
    );
    return true;
  }

  AppBar buildAppBar(
      GlobalKey<ScaffoldState> key,
      ThemeData tema,
      BuildContext context,
      dynamic loadingController,
      dynamic headerAniInterval) {
    final controller = locator<DrawerNavegacaoController>();

    final Widget botaoMenu = IconButton(
        color: Constants.primariaContraste,
        icon: Icon(FontAwesomeIcons.bars),
        onPressed: () => key.currentState!.openDrawer());

    final botaoSair = IconButton(
        color: Constants.primariaContraste,
        icon: Icon(FontAwesomeIcons.signOutAlt),
        onPressed: () => goToLogin(context));

    final titulo = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Hero(
              tag: 'near.huscarl.loginsample.logo',
              child: Image.asset(
                Constants.logo,
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
        child: controller.selectedindex == 0 ? Container() : botaoMenu,
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
