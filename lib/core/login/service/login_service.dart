import 'package:flutter_login/flutter_login.dart';
import 'package:projetoflutter/core/login/entity/usuario_autenticado_entity.dart';

class LoginService {
  Future<UsuarioAutenticadoEntity> autenticar(LoginData? loginData) async {
    return UsuarioAutenticadoEntity(
        sucesso: true, mensagem: '', usuarioAutenticado: null);
  }
}
