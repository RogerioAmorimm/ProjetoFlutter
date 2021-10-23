class TiposDeSolicitacaoEntity {
  late String id;
  late String descricao;

  TiposDeSolicitacaoEntity({
    required this.id,
    required this.descricao,
  });

  TiposDeSolicitacaoEntity.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      id = json['id'];
      descricao = json['descricao'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
    };
  }
}
