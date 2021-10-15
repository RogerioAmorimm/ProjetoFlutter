import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projetoflutter/components/drawerNavegacao/entity/item_menu_entity.dart';
part 'drawer_navegacao_controller.g.dart';

class DrawerNavegacaoController extends _DrawerNavegacaoController
    with _$DrawerNavegacaoController {}

abstract class _DrawerNavegacaoController with Store {
  @observable
  int selectedindex = 0;

  @observable
  int selectedindexHome = 0;

  @observable
  List<ItemMenu> menusDisponiveis = <ItemMenu>[];

  @action
  void limpar() {
    selectedindex = 0;
    selectedindexHome = 0;
    menusDisponiveis = <ItemMenu>[];
  }

  @action
  void mudarIndex(int index) {
    carregueMenus(index);
  }

  void carregueMenus(int index) {
    if (index <= 5) {
      selectedindex = index;
    }

    selectedindexHome = index;

    menusDisponiveis = <ItemMenu>[
      ItemMenu(0, 'Home', Icons.home),
      ItemMenu(1, 'Mensagens', Icons.message),
      ItemMenu(2, 'Solicitações', Icons.fact_check),
    ];
  }
}
