class MensagemErro {
  late String mensagem;
  late String dataHora;
  late String id;
  MensagemErro(
      {required this.mensagem, required this.dataHora, required this.id});

  MensagemErro.fromJson(Map<String, dynamic> json) {
    mensagem = json['mensagem'];
    dataHora = json['dataHora'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mensagem'] = mensagem;
    data['dataHora'] = dataHora;
    data['id'] = id;
    return data;
  }
}
