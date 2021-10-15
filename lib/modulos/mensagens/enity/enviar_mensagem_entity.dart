class EnviarMensagemEntity {
  late int id;
  late String mensagem;

  EnviarMensagemEntity(
    this.id,
    this.mensagem,
  );

  EnviarMensagemEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mensagem'] = mensagem;
    return data;
  }
}
