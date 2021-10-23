import 'package:intl/intl.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/tipos_de_solicitacao_entity.dart';

class SolicitacaoEntity {
  late int id;
  late TiposDeSolicitacaoEntity tipo;
  late String dataSolicitacao;
  late String status;
  late String solicitante;  
  late int solicitanteId;
  late String motivo;


  SolicitacaoEntity(
      {required this.id,
      required this.tipo,
      required this.dataSolicitacao,
      required this.status,
      required this.solicitante,
      required this.motivo,
      required this.solicitanteId});

  SolicitacaoEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataSolicitacao =
        '${DateFormat('dd/MM/yyyy').format(DateTime.parse(json['data']))}';
    status = json['status'];
    solicitanteId = json['solicitanteId'];
    solicitante = json['solicitante'];
    motivo = json['motivo'];
    if (json['tipo'] != null) {
      tipo = TiposDeSolicitacaoEntity.fromJson(json['tipo']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = dataSolicitacao;
    data['status'] = status;
    data['solicitanteId'] = solicitanteId;
    data['solicitante'] = solicitante;
    data['motivo'] = motivo;
    data['tipo'] = tipo.toJson();
    return data;
  }
}
