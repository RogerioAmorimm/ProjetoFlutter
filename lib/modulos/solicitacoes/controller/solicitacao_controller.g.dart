// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SolicitacaoController on _SolicitacaoControllerBase, Store {
  Computed<StatusRequest>? _$statusComputed;

  @override
  StatusRequest get status =>
      (_$statusComputed ??= Computed<StatusRequest>(() => super.status,
              name: '_SolicitacaoControllerBase.status'))
          .value;

  final _$solicitacoesObservableAtom =
      Atom(name: '_SolicitacaoControllerBase.solicitacoesObservable');

  @override
  ObservableFuture<List<SolicitacaoEntity>>? get solicitacoesObservable {
    _$solicitacoesObservableAtom.reportRead();
    return super.solicitacoesObservable;
  }

  @override
  set solicitacoesObservable(ObservableFuture<List<SolicitacaoEntity>>? value) {
    _$solicitacoesObservableAtom
        .reportWrite(value, super.solicitacoesObservable, () {
      super.solicitacoesObservable = value;
    });
  }

  final _$erroProcessamentoAtom =
      Atom(name: '_SolicitacaoControllerBase.erroProcessamento');

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

  final _$carregueUltimasSolicitacoesAsyncAction =
      AsyncAction('_SolicitacaoControllerBase.carregueUltimasSolicitacoes');

  @override
  Future<void> carregueUltimasSolicitacoes() {
    return _$carregueUltimasSolicitacoesAsyncAction
        .run(() => super.carregueUltimasSolicitacoes());
  }

  @override
  String toString() {
    return '''
solicitacoesObservable: ${solicitacoesObservable},
erroProcessamento: ${erroProcessamento},
status: ${status}
    ''';
  }
}
