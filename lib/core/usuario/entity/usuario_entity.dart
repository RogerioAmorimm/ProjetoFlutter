import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/sharedPreference/shared_preferences_util.dart';

class UsuarioEntity {
  late String token;
  late String usuario;
  late String senha;
  late int id;
  late String nome;

  UsuarioEntity(
      {required this.token,
      required this.usuario,
      required this.senha,
      required this.id,
      required this.nome});

  UsuarioEntity.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    usuario = json['usuario'];
    senha = json['senha'];
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'usuario': usuario,
      'senha': senha,
      'id': id,
      'nome': nome,
    };
  }

  Future salvarToken() async {
    await SharedPreferenceUtil.setString(Constants.spToken, token);
    if (id != 0) {
      await SharedPreferenceUtil.setInt(Constants.spId, id);
    }
    await SharedPreferenceUtil.setString(Constants.spUsuario, usuario);
    await SharedPreferenceUtil.setString(Constants.spSenha, senha);
  }

  Future limparToken() async {
    await SharedPreferenceUtil.setString(Constants.spUsuario, '');
    await SharedPreferenceUtil.setString(Constants.spSenha, '');
    await SharedPreferenceUtil.setString(Constants.spToken, '');
    await SharedPreferenceUtil.setInt(Constants.spId, 0);
  }

  static Future<bool> ehUsuarioLogadoLocalmente() async =>
      await SharedPreferenceUtil.getString(Constants.spUsuario) != '' &&
      await SharedPreferenceUtil.getString(Constants.spSenha) != '' &&
      await SharedPreferenceUtil.getString(Constants.spToken) != '';
}
