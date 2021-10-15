// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardController on _CardControllerBase, Store {
  Computed<StatusRequest>? _$statusComputed;

  @override
  StatusRequest get status =>
      (_$statusComputed ??= Computed<StatusRequest>(() => super.status,
              name: '_CardControllerBase.status'))
          .value;

  final _$cardsObserverAtom = Atom(name: '_CardControllerBase.cardsObserver');

  @override
  ObservableFuture<List<CardEntity>>? get cardsObserver {
    _$cardsObserverAtom.reportRead();
    return super.cardsObserver;
  }

  @override
  set cardsObserver(ObservableFuture<List<CardEntity>>? value) {
    _$cardsObserverAtom.reportWrite(value, super.cardsObserver, () {
      super.cardsObserver = value;
    });
  }

  final _$cardsAtom = Atom(name: '_CardControllerBase.cards');

  @override
  List<CardEntity>? get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(List<CardEntity>? value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  final _$erroProcessamentoAtom =
      Atom(name: '_CardControllerBase.erroProcessamento');

  @override
  String? get erroProcessamento {
    _$erroProcessamentoAtom.reportRead();
    return super.erroProcessamento;
  }

  @override
  set erroProcessamento(String? value) {
    _$erroProcessamentoAtom.reportWrite(value, super.erroProcessamento, () {
      super.erroProcessamento = value;
    });
  }

  final _$_CardControllerBaseActionController =
      ActionController(name: '_CardControllerBase');

  @override
  void obterProximosCards() {
    final _$actionInfo = _$_CardControllerBaseActionController.startAction(
        name: '_CardControllerBase.obterProximosCards');
    try {
      return super.obterProximosCards();
    } finally {
      _$_CardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<ItemCardPage> listaDeCards() {
    final _$actionInfo = _$_CardControllerBaseActionController.startAction(
        name: '_CardControllerBase.listaDeCards');
    try {
      return super.listaDeCards();
    } finally {
      _$_CardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardsObserver: ${cardsObserver},
cards: ${cards},
erroProcessamento: ${erroProcessamento},
status: ${status}
    ''';
  }
}
