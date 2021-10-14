import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetoflutter/components/AppBar/app_bar_componente.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/utils/constants.dart';

class DrawerNavegacaoPage extends StatefulWidget {
  const DrawerNavegacaoPage({Key? key}) : super(key: key);

  @override
  _DrawerNavegacaoPage createState() => _DrawerNavegacaoPage();
}

class _DrawerNavegacaoPage extends State<DrawerNavegacaoPage> {
  @override
  Widget build(BuildContext context) {
    final controller = locator<DrawerNavegacaoController>();

    return Observer(
      builder: (_) {
        return Drawer(
          child: Column(
            children: <Widget>[
              _createHeader(),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: controller.menusDisponiveis
                      .map(
                        (item) => _createDrawerItem(
                          selecionado: item.indice == controller.selectedindex,
                          icon: item.icone,
                          text: item.descricao,
                          onTap: () {
                            Navigator.pop(context);
                            _updateMenu(item.indice, controller);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              const Divider(),
              _createDrawerItem(
                  selecionado: false,
                  icon: Icons.exit_to_app,
                  text: 'Sair',
                  onTap: () => AppBarComponente.goToLogin(context)),
            ],
          ),
        );
      },
    );
  }

  Widget _createHeader() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        decoration: const BoxDecoration(color: Constants.primaria),
        child: Stack(children: <Widget>[
          Center(
            child: Image.asset(
              Constants.logo,
              filterQuality: FilterQuality.high,
              height: 50,
            ),
          ),
        ]));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required bool selecionado,
      required GestureTapCallback onTap}) {
    return ListTile(
      tileColor: selecionado ? Constants.primaria.shade50 : null,
      title: Row(
        children: <Widget>[
          Icon(icon, size: 30, color: Constants.primaria),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              text,
              style: TextStyle(color: Constants.accent.shade900, fontSize: 16),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

void _updateMenu(int index, DrawerNavegacaoController controller) {
  controller.mudarIndex(index);
}
