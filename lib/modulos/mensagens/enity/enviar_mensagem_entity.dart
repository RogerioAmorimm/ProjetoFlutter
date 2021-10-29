class EnviarMensagemEntity {
  late String remetenteId;
  late String mensagem;
  late String destinatarioId;

  EnviarMensagemEntity(
    this.remetenteId,
    this.mensagem,
    this.destinatarioId
  );

  EnviarMensagemEntity.fromJson(Map<String, dynamic> json) {
    remetenteId = json['remetenteId'];
    mensagem = json['mensagem'];
    destinatarioId = json['destinatarioId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remetenteId'] = remetenteId;
    data['mensagem'] = mensagem;
    data['destinatarioId'] = destinatarioId;
    return data;
  }
}
