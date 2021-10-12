import 'package:projetoflutter/core/login/entity/login_entity.dart';
import 'package:projetoflutter/core/login/entity/usuario_autenticado_entity.dart';

class LoginService {
  Future<UsuarioAutenticadoEntity> autenticar(LoginEntity? loginData) async {
    return UsuarioAutenticadoEntity(
        sucesso: true, mensagem: '', usuarioAutenticado: null);
  }
}
