// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioController on _UsuarioControllerBase, Store {
  final _$_usuarioAtom = Atom(name: '_UsuarioControllerBase._usuario');

  @override
  UsuarioEntity? get _usuario {
    _$_usuarioAtom.reportRead();
    return super._usuario;
  }

  @override
  set _usuario(UsuarioEntity? value) {
    _$_usuarioAtom.reportWrite(value, super._usuario, () {
      super._usuario = value;
    });
  }

  final _$setUsuarioLogadoAsyncAction =
      AsyncAction('_UsuarioControllerBase.setUsuarioLogado');

  @override
  Future<dynamic> setUsuarioLogado(UsuarioEntity? usuario) {
    return _$setUsuarioLogadoAsyncAction
        .run(() => super.setUsuarioLogado(usuario));
  }

  final _$_UsuarioControllerBaseActionController =
      ActionController(name: '_UsuarioControllerBase');

  @override
  UsuarioEntity? getUsuarioLogado() {
    final _$actionInfo = _$_UsuarioControllerBaseActionController.startAction(
        name: '_UsuarioControllerBase.getUsuarioLogado');
    try {
      return super.getUsuarioLogado();
    } finally {
      _$_UsuarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
