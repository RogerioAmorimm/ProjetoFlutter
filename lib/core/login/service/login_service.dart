import 'package:flutter_login/flutter_login.dart';
import 'package:projetoflutter/core/login/entity/usuario_autenticado_entity.dart';
import 'package:projetoflutter/core/usuario/entity/usuario_entity.dart';

class LoginService {
  Future<UsuarioAutenticadoEntity> autenticar(LoginData? loginData) async {
   //TODO:CONECTAR API
    return UsuarioAutenticadoEntity(
        sucesso: true,
        mensagem: '',
        usuarioAutenticado: UsuarioEntity(
            id: 1,
            nome: 'Rogério',
            senha: "123456",
            usuario: "rogerio.amorim",
            token: ""));
  }
}
