class CardEntity {
  late String urlFotoPerfil;
  late String nome;
  late int id;

  CardEntity({
    required this.urlFotoPerfil,
    required this.nome,
    required this.id,
  });

  CardEntity.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    urlFotoPerfil = json['foto'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['foto'] = urlFotoPerfil;
    data['id'] = id;
    return data;
  }
}
