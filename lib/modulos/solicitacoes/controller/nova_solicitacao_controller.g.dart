// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nova_solicitacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovaSolicitacaoController on _NovaSolicitacaoControllerBase, Store {
  Computed<StatusRequest>? _$statusComputed;

  @override
  StatusRequest get status =>
      (_$statusComputed ??= Computed<StatusRequest>(() => super.status,
              name: '_NovaSolicitacaoControllerBase.status'))
          .value;

  final _$tiposDeSolicitacaoAtom =
      Atom(name: '_NovaSolicitacaoControllerBase.tiposDeSolicitacao');

  @override
  List<TiposDeSolicitacaoEntity>? get tiposDeSolicitacao {
    _$tiposDeSolicitacaoAtom.reportRead();
    return super.tiposDeSolicitacao;
  }

  @override
  set tiposDeSolicitacao(List<TiposDeSolicitacaoEntity>? value) {
    _$tiposDeSolicitacaoAtom.reportWrite(value, super.tiposDeSolicitacao, () {
      super.tiposDeSolicitacao = value;
    });
  }

  final _$tipoDeSolicitacaoSelecionadaAtom =
      Atom(name: '_NovaSolicitacaoControllerBase.tipoDeSolicitacaoSelecionada');

  @override
  TiposDeSolicitacaoEntity? get tipoDeSolicitacaoSelecionada {
    _$tipoDeSolicitacaoSelecionadaAtom.reportRead();
    return super.tipoDeSolicitacaoSelecionada;
  }

  @override
  set tipoDeSolicitacaoSelecionada(TiposDeSolicitacaoEntity? value) {
    _$tipoDeSolicitacaoSelecionadaAtom
        .reportWrite(value, super.tipoDeSolicitacaoSelecionada, () {
      super.tipoDeSolicitacaoSelecionada = value;
    });
  }

  final _$motivoAtom = Atom(name: '_NovaSolicitacaoControllerBase.motivo');

  @override
  TextEditingController get motivo {
    _$motivoAtom.reportRead();
    return super.motivo;
  }

  @override
  set motivo(TextEditingController value) {
    _$motivoAtom.reportWrite(value, super.motivo, () {
      super.motivo = value;
    });
  }

  final _$erroProcessamentoAtom =
      Atom(name: '_NovaSolicitacaoControllerBase.erroProcessamento');

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

  final _$tiposDeSolicitacaoObserverAtom =
      Atom(name: '_NovaSolicitacaoControllerBase.tiposDeSolicitacaoObserver');

  @override
  ObservableFuture<List<TiposDeSolicitacaoEntity>>?
      get tiposDeSolicitacaoObserver {
    _$tiposDeSolicitacaoObserverAtom.reportRead();
    return super.tiposDeSolicitacaoObserver;
  }

  @override
  set tiposDeSolicitacaoObserver(
      ObservableFuture<List<TiposDeSolicitacaoEntity>>? value) {
    _$tiposDeSolicitacaoObserverAtom
        .reportWrite(value, super.tiposDeSolicitacaoObserver, () {
      super.tiposDeSolicitacaoObserver = value;
    });
  }

  final _$carregueTiposDeSolicitacaoAsyncAction =
      AsyncAction('_NovaSolicitacaoControllerBase.carregueTiposDeSolicitacao');

  @override
  Future<dynamic> carregueTiposDeSolicitacao() {
    return _$carregueTiposDeSolicitacaoAsyncAction
        .run(() => super.carregueTiposDeSolicitacao());
  }

  final _$novaSolicitacaoAsyncAction =
      AsyncAction('_NovaSolicitacaoControllerBase.novaSolicitacao');

  @override
  Future<dynamic> novaSolicitacao(NovaSolicitacaoEntity novaSolicitacao) {
    return _$novaSolicitacaoAsyncAction
        .run(() => super.novaSolicitacao(novaSolicitacao));
  }

  final _$_NovaSolicitacaoControllerBaseActionController =
      ActionController(name: '_NovaSolicitacaoControllerBase');

  @override
  void setTipoDeSolicitacaoSelecionada(String chave) {
    final _$actionInfo =
        _$_NovaSolicitacaoControllerBaseActionController.startAction(
            name:
                '_NovaSolicitacaoControllerBase.setTipoDeSolicitacaoSelecionada');
    try {
      return super.setTipoDeSolicitacaoSelecionada(chave);
    } finally {
      _$_NovaSolicitacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validarTiposSolicitacao(dynamic tipoSolicitacao) {
    final _$actionInfo =
        _$_NovaSolicitacaoControllerBaseActionController.startAction(
            name: '_NovaSolicitacaoControllerBase.validarTiposSolicitacao');
    try {
      return super.validarTiposSolicitacao(tipoSolicitacao);
    } finally {
      _$_NovaSolicitacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validarMotivoSolicitacao(dynamic motivoSolicitacao) {
    final _$actionInfo =
        _$_NovaSolicitacaoControllerBaseActionController.startAction(
            name: '_NovaSolicitacaoControllerBase.validarMotivoSolicitacao');
    try {
      return super.validarMotivoSolicitacao(motivoSolicitacao);
    } finally {
      _$_NovaSolicitacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limpaTelaDeNovaSolicitacao() {
    final _$actionInfo =
        _$_NovaSolicitacaoControllerBaseActionController.startAction(
            name: '_NovaSolicitacaoControllerBase.limpaTelaDeNovaSolicitacao');
    try {
      return super.limpaTelaDeNovaSolicitacao();
    } finally {
      _$_NovaSolicitacaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tiposDeSolicitacao: ${tiposDeSolicitacao},
tipoDeSolicitacaoSelecionada: ${tipoDeSolicitacaoSelecionada},
motivo: ${motivo},
erroProcessamento: ${erroProcessamento},
tiposDeSolicitacaoObserver: ${tiposDeSolicitacaoObserver},
status: ${status}
    ''';
  }
}
