class NovaSolicitacaoEntity {
  late int id;
  late String tipoSolicitacaoId;
  late String solicitanteId;
  late String motivo;

  NovaSolicitacaoEntity({
    required this.id,
    required this.tipoSolicitacaoId,
    required this.solicitanteId,
    required this.motivo,
  });

  NovaSolicitacaoEntity.fromJson(Map<String, dynamic> json) {
    tipoSolicitacaoId = json['tipoSolicitacaoId'];
    solicitanteId = json['solicitanteId'];
    motivo = json['motivo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipoSolicitacaoId': tipoSolicitacaoId,
      'solicitanteId': solicitanteId,
      'motivo': motivo,
    };
  }
}
