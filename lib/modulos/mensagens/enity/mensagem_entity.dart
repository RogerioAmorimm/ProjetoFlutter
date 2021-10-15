import 'mensagens_entity.dart';

class MensagemEntity {
  late int total;
  late int pagina;
  late int quantidadePorPagina;
  late int quantidadeDePaginas;
  late int quantidadeDestaPagina;
  late bool possuiProximo;
  late bool possuiAnterior;
  late int proximaPagina;
  late int paginaAnterior;
  late List<Mensagens>? mensagens;

  MensagemEntity({
    required this.total,
    required this.pagina,
    required this.quantidadePorPagina,
    required this.quantidadeDePaginas,
    required this.quantidadeDestaPagina,
    required this.possuiProximo,
    required this.possuiAnterior,
    required this.proximaPagina,
    required this.paginaAnterior,
    required this.mensagens,
  });

  MensagemEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pagina = json['pagina'];
    quantidadePorPagina = json['quantidadePorPagina'];
    quantidadeDePaginas = json['quantidadeDePaginas'];
    quantidadeDestaPagina = json['quantidadeDestaPagina'];
    possuiProximo = json['possuiProximo'];
    possuiAnterior = json['possuiAnterior'];
    proximaPagina = json['proximaPagina'];
    paginaAnterior = json['paginaAnterior'];
    if (json['mensagens'] != null) {
      mensagens = <Mensagens>[];
      json['mensagens'].forEach((v) {
        mensagens!.add(Mensagens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['pagina'] = pagina;
    data['quantidadePorPagina'] = quantidadePorPagina;
    data['quantidadeDePaginas'] = quantidadeDePaginas;
    data['quantidadeDestaPagina'] = quantidadeDestaPagina;
    data['possuiProximo'] = possuiProximo;
    data['possuiAnterior'] = possuiAnterior;
    data['proximaPagina'] = proximaPagina;
    data['paginaAnterior'] = paginaAnterior;
    if (mensagens != null) {
      data['mensagens'] = mensagens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
