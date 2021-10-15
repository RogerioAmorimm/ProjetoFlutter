class Mensagens {
  late int id;
  late String usuario;
  late String mensagem;
  late DateTime dataHora;

  Mensagens(
      {required this.id,
      required this.usuario,
      required this.mensagem,
      required this.dataHora});

  Mensagens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
    mensagem = json['mensagem'];
    dataHora = DateTime.parse(json['dataHora']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['usuario'] = usuario;
    data['mensagem'] = mensagem;
    data['dataHora'] = dataHora;
    return data;
  }
}
