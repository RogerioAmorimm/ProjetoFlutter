// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<StatusRequest>? _$statusComputed;

  @override
  StatusRequest get status =>
      (_$statusComputed ??= Computed<StatusRequest>(() => super.status,
              name: '_HomeController.status'))
          .value;

  final _$observerAtom = Atom(name: '_HomeController.observer');

  @override
  ObservableFuture<bool>? get observer {
    _$observerAtom.reportRead();
    return super.observer;
  }

  @override
  set observer(ObservableFuture<bool>? value) {
    _$observerAtom.reportWrite(value, super.observer, () {
      super.observer = value;
    });
  }

  final _$dadosCarregadosAtom = Atom(name: '_HomeController.dadosCarregados');

  @override
  bool? get dadosCarregados {
    _$dadosCarregadosAtom.reportRead();
    return super.dadosCarregados;
  }

  @override
  set dadosCarregados(bool? value) {
    _$dadosCarregadosAtom.reportWrite(value, super.dadosCarregados, () {
      super.dadosCarregados = value;
    });
  }

  final _$erroProcessamentoAtom =
      Atom(name: '_HomeController.erroProcessamento');

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

  final _$carregarDadosHomeAsyncAction =
      AsyncAction('_HomeController.carregarDadosHome');

  @override
  Future<dynamic> carregarDadosHome() {
    return _$carregarDadosHomeAsyncAction.run(() => super.carregarDadosHome());
  }

  @override
  String toString() {
    return '''
observer: ${observer},
dadosCarregados: ${dadosCarregados},
erroProcessamento: ${erroProcessamento},
status: ${status}
    ''';
  }
}
