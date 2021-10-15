// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MensagemController on _MensagemControllerBase, Store {
  Computed<StatusRequest>? _$statusComputed;

  @override
  StatusRequest get status =>
      (_$statusComputed ??= Computed<StatusRequest>(() => super.status,
              name: '_MensagemControllerBase.status'))
          .value;

  final _$filtroDeTextoAtom =
      Atom(name: '_MensagemControllerBase.filtroDeTexto');

  @override
  String get filtroDeTexto {
    _$filtroDeTextoAtom.reportRead();
    return super.filtroDeTexto;
  }

  @override
  set filtroDeTexto(String value) {
    _$filtroDeTextoAtom.reportWrite(value, super.filtroDeTexto, () {
      super.filtroDeTexto = value;
    });
  }

  final _$textEditingControllerAtom =
      Atom(name: '_MensagemControllerBase.textEditingController');

  @override
  TextEditingController get textEditingController {
    _$textEditingControllerAtom.reportRead();
    return super.textEditingController;
  }

  @override
  set textEditingController(TextEditingController value) {
    _$textEditingControllerAtom.reportWrite(value, super.textEditingController,
        () {
      super.textEditingController = value;
    });
  }

  final _$erroProcessamentoAtom =
      Atom(name: '_MensagemControllerBase.erroProcessamento');

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

  final _$listaDeMensagensObserverAtom =
      Atom(name: '_MensagemControllerBase.listaDeMensagensObserver');

  @override
  ObservableFuture<List<Mensagens>>? get listaDeMensagensObserver {
    _$listaDeMensagensObserverAtom.reportRead();
    return super.listaDeMensagensObserver;
  }

  @override
  set listaDeMensagensObserver(ObservableFuture<List<Mensagens>>? value) {
    _$listaDeMensagensObserverAtom
        .reportWrite(value, super.listaDeMensagensObserver, () {
      super.listaDeMensagensObserver = value;
    });
  }

  final _$listaDeMensagensAtom =
      Atom(name: '_MensagemControllerBase.listaDeMensagens');

  @override
  List<Mensagens>? get listaDeMensagens {
    _$listaDeMensagensAtom.reportRead();
    return super.listaDeMensagens;
  }

  @override
  set listaDeMensagens(List<Mensagens>? value) {
    _$listaDeMensagensAtom.reportWrite(value, super.listaDeMensagens, () {
      super.listaDeMensagens = value;
    });
  }

  final _$carregarNovaPaginaMensagensAsyncAction =
      AsyncAction('_MensagemControllerBase.carregarNovaPaginaMensagens');

  @override
  Future<List<Mensagens>?> carregarNovaPaginaMensagens(int page) {
    return _$carregarNovaPaginaMensagensAsyncAction
        .run(() => super.carregarNovaPaginaMensagens(page));
  }

  final _$adicionarNovaMensagemAsyncAction =
      AsyncAction('_MensagemControllerBase.adicionarNovaMensagem');

  @override
  Future<void> adicionarNovaMensagem() {
    return _$adicionarNovaMensagemAsyncAction
        .run(() => super.adicionarNovaMensagem());
  }

  final _$_MensagemControllerBaseActionController =
      ActionController(name: '_MensagemControllerBase');

  @override
  void initPaginacao() {
    final _$actionInfo = _$_MensagemControllerBaseActionController.startAction(
        name: '_MensagemControllerBase.initPaginacao');
    try {
      return super.initPaginacao();
    } finally {
      _$_MensagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualizar() {
    final _$actionInfo = _$_MensagemControllerBaseActionController.startAction(
        name: '_MensagemControllerBase.atualizar');
    try {
      return super.atualizar();
    } finally {
      _$_MensagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtroDeTexto: ${filtroDeTexto},
textEditingController: ${textEditingController},
erroProcessamento: ${erroProcessamento},
listaDeMensagensObserver: ${listaDeMensagensObserver},
listaDeMensagens: ${listaDeMensagens},
status: ${status}
    ''';
  }
}
