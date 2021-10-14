// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_navegacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerNavegacaoController on _DrawerNavegacaoController, Store {
  final _$selectedindexAtom =
      Atom(name: '_DrawerNavegacaoController.selectedindex');

  @override
  int get selectedindex {
    _$selectedindexAtom.reportRead();
    return super.selectedindex;
  }

  @override
  set selectedindex(int value) {
    _$selectedindexAtom.reportWrite(value, super.selectedindex, () {
      super.selectedindex = value;
    });
  }

  final _$selectedindexHomeAtom =
      Atom(name: '_DrawerNavegacaoController.selectedindexHome');

  @override
  int get selectedindexHome {
    _$selectedindexHomeAtom.reportRead();
    return super.selectedindexHome;
  }

  @override
  set selectedindexHome(int value) {
    _$selectedindexHomeAtom.reportWrite(value, super.selectedindexHome, () {
      super.selectedindexHome = value;
    });
  }

  final _$menusDisponiveisAtom =
      Atom(name: '_DrawerNavegacaoController.menusDisponiveis');

  @override
  List<ItemMenu> get menusDisponiveis {
    _$menusDisponiveisAtom.reportRead();
    return super.menusDisponiveis;
  }

  @override
  set menusDisponiveis(List<ItemMenu> value) {
    _$menusDisponiveisAtom.reportWrite(value, super.menusDisponiveis, () {
      super.menusDisponiveis = value;
    });
  }

  final _$_DrawerNavegacaoControllerActionController =
      ActionController(name: '_DrawerNavegacaoController');

  @override
  void limpar() {
    final _$actionInfo = _$_DrawerNavegacaoControllerActionController
        .startAction(name: '_DrawerNavegacaoController.limpar');
    try {
      return super.limpar();
    } finally {
      _$_DrawerNavegacaoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mudarIndex(int index) {
    final _$actionInfo = _$_DrawerNavegacaoControllerActionController
        .startAction(name: '_DrawerNavegacaoController.mudarIndex');
    try {
      return super.mudarIndex(index);
    } finally {
      _$_DrawerNavegacaoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedindex: ${selectedindex},
selectedindexHome: ${selectedindexHome},
menusDisponiveis: ${menusDisponiveis}
    ''';
  }
}
