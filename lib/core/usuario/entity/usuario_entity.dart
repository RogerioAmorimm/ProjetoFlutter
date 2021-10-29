import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/sharedPreference/shared_preferences_util.dart';

class UsuarioEntity {
  late String token;
  late String email;
  late String senha;
  late String id;
  late String nome;

  UsuarioEntity(
      {required this.token,
      required this.email,
      required this.senha,
      required this.id,
      required this.nome});

  UsuarioEntity.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    senha = json['password'];
    id = json['_id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'email': email,
      'password': senha,
      '_id': id,
      'nome': nome,
    };
  }

  Future salvarToken() async {
    await SharedPreferenceUtil.setString(Constants.spToken, token);
    if (id.isNotEmpty) {
      await SharedPreferenceUtil.setString(Constants.spId, id);
    }
    await SharedPreferenceUtil.setString(Constants.spEmail, email);
    await SharedPreferenceUtil.setString(Constants.spSenha, senha);
  }

  Future limparToken() async {
    await SharedPreferenceUtil.setString(Constants.spEmail, '');
    await SharedPreferenceUtil.setString(Constants.spSenha, '');
    await SharedPreferenceUtil.setString(Constants.spToken, '');
    await SharedPreferenceUtil.setString(Constants.spId, '');
  }

  static Future<bool> ehUsuarioLogadoLocalmente() async =>
      await SharedPreferenceUtil.getString(Constants.spEmail) != '' &&
      await SharedPreferenceUtil.getString(Constants.spSenha) != '' &&
      await SharedPreferenceUtil.getString(Constants.spToken) != '' &&
      await SharedPreferenceUtil.getString(Constants.spId) != '' &&
      await SharedPreferenceUtil.getString(Constants.spNome) != '';
}
