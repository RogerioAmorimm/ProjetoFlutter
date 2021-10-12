import 'dart:convert';

class ValidacaoServer extends Error {
  ValidacaoServer({
    required this.mensagem,
    this.sucesso = false,
  });

  factory ValidacaoServer.fromMap(Map<String, dynamic> map) => ValidacaoServer(
        sucesso: map['sucesso'],
        mensagem: map['mensagem'],
      );

  factory ValidacaoServer.fromJson(String source) =>
      ValidacaoServer.fromMap(json.decode(source));

  bool sucesso;
  String mensagem;

  Map<String, dynamic> toMap() => {
        'sucesso': sucesso,
        'mensagem': mensagem,
      };

  factory ValidacaoServer.erroGenerico() =>
      ValidacaoServer(sucesso: false, mensagem: 'Tente novamente');

  factory ValidacaoServer.erroConexao() => ValidacaoServer(
      sucesso: false,
      mensagem: 'Verifique se seu Wi-Fi está conectado, '
          'ou se seu pacote de dados está ativo!');

  String toJson() => json.encode(toMap());
}
