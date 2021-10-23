import 'package:flutter/material.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/page/modal_solicitacao.dart';
import 'package:projetoflutter/utils/constants.dart';

// ignore: must_be_immutable
class ListSolicitacoesComponente extends StatefulWidget {
  SolicitacaoEntity solicitacao;

  ListSolicitacoesComponente({required this.solicitacao});

  @override
  _ListSolicitacoesComponenteState createState() =>
      _ListSolicitacoesComponenteState();
}

class _ListSolicitacoesComponenteState
    extends State<ListSolicitacoesComponente> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {_mostrarSolicitacao(context, widget.solicitacao)},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          elevation: 8,
          clipBehavior: Clip.hardEdge,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Constants.accent.shade100,
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: Constants.accent.shade200)),
                          padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              widget.solicitacao.tipo.descricao,
                              style: TextStyle(
                                  color: Constants.primaria.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      widget.solicitacao.status,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.solicitacao.dataSolicitacao,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                          Icon(Icons.keyboard_arrow_right,
                              color: Constants.primaria.shade400, size: 30),
                        ]),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _mostrarSolicitacao(context, SolicitacaoEntity solicitacao) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return ModalSolicitacao(
        titulo: solicitacao.tipo.descricao,
        dados: {
          'Data da Solicitação: ': solicitacao.dataSolicitacao,
          'Situação: ': solicitacao.status,
          'Solicitante: ': solicitacao.solicitante,
          'Motivo: ': solicitacao.motivo
        },
        botaoAdicional: null,
      );
    },
  );
}
