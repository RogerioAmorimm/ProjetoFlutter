import 'package:projetoflutter/core/usuario/entity/usuario_entity.dart';

class UsuarioAutenticadoEntity {
  late bool sucesso;
  late List<String> errors;
  late UsuarioEntity? usuarioAutenticado;
  UsuarioAutenticadoEntity({
    required this.sucesso,
    required this.errors,
    required this.usuarioAutenticado,
  });

  UsuarioAutenticadoEntity.fromJson(Map<String, dynamic> json) {
    sucesso = json['sucesso'];
    errors = json['errors'];
    if (json['data'] != null) {
      usuarioAutenticado = UsuarioEntity.fromJson(json['data']);
    } else {
      usuarioAutenticado = null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'sucesso': sucesso,
      'errors': errors,
      if (usuarioAutenticado != null) 'usuarioAutenticado': usuarioAutenticado,
    };
  }
}
