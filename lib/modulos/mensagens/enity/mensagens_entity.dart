class Mensagens {
  late String id;
  late String usuario;
  late String mensagem;
  late DateTime dataHora;

  Mensagens(
      {required this.id,
      required this.usuario,
      required this.mensagem});

  Mensagens.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    usuario = json['remetenteId'];
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['remetenteId'] = usuario;
    data['mensagem'] = mensagem;
    return data;
  }
}
