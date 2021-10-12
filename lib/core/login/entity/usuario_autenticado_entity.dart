import 'package:projetoflutter/core/usuario/entity/usuario_entity.dart';

class UsuarioAutenticadoEntity {
  late bool sucesso;
  late String mensagem;
  late UsuarioEntity? usuarioAutenticado;
  UsuarioAutenticadoEntity({
    required this.sucesso,
    required this.mensagem,
    required this.usuarioAutenticado,
  });

  UsuarioAutenticadoEntity.fromJson(Map<String, dynamic> json) {
    sucesso = json['sucesso'];
    mensagem = json['mensagem'];
    if (json['usuarioAutenticado'] != null) {
      usuarioAutenticado = UsuarioEntity.fromJson(json['usuarioAutenticado']);
    } else {
      usuarioAutenticado = null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'sucesso': sucesso,
      'mensagem': mensagem,
      if (usuarioAutenticado != null) 'usuarioAutenticado': usuarioAutenticado,
    };
  }
}
