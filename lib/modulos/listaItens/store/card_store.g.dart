// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardStore on _CardStoreBase, Store {
  final _$_cardSelecionadoAtom = Atom(name: '_CardStoreBase._cardSelecionado');

  @override
  CardEntity? get _cardSelecionado {
    _$_cardSelecionadoAtom.reportRead();
    return super._cardSelecionado;
  }

  @override
  set _cardSelecionado(CardEntity? value) {
    _$_cardSelecionadoAtom.reportWrite(value, super._cardSelecionado, () {
      super._cardSelecionado = value;
    });
  }

  final _$_CardStoreBaseActionController =
      ActionController(name: '_CardStoreBase');

  @override
  void mudarCard(CardEntity card) {
    final _$actionInfo = _$_CardStoreBaseActionController.startAction(
        name: '_CardStoreBase.mudarCard');
    try {
      return super.mudarCard(card);
    } finally {
      _$_CardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  CardEntity? getCard() {
    final _$actionInfo = _$_CardStoreBaseActionController.startAction(
        name: '_CardStoreBase.getCard');
    try {
      return super.getCard();
    } finally {
      _$_CardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limpar() {
    final _$actionInfo = _$_CardStoreBaseActionController.startAction(
        name: '_CardStoreBase.limpar');
    try {
      return super.limpar();
    } finally {
      _$_CardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
