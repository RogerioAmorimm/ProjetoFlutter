// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$logarAsyncAction = AsyncAction('_LoginControllerBase.logar');

  @override
  Future<String> logar(LoginEntity loginData) {
    return _$logarAsyncAction.run(() => super.logar(loginData));
  }

  final _$logadoAsyncAction = AsyncAction('_LoginControllerBase.logado');

  @override
  Future<String> logado(LoginEntity loginData) {
    return _$logadoAsyncAction.run(() => super.logado(loginData));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  String? validarUsuario(String? usuario) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validarUsuario');
    try {
      return super.validarUsuario(usuario);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validarSenha(String? senha) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validarSenha');
    try {
      return super.validarSenha(senha);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<String> recuperarSenha(String info) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.recuperarSenha');
    try {
      return super.recuperarSenha(info);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submeterAposAnimacaoCompleta(BuildContext context) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.submeterAposAnimacaoCompleta');
    try {
      return super.submeterAposAnimacaoCompleta(context);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
