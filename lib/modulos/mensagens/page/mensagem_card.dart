import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/responsividade/responsividade_util.dart';
import 'package:projetoflutter/utils/responsividade/view_port_util.dart';

class MensagemCard extends StatelessWidget {
  final DateTime data;
  final String mensagem;
  final String origem;
  const MensagemCard({
    required this.data,
    required this.mensagem,
    required this.origem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataFormatada = DateFormat('dd/MM/yyyy kk:mm').format(data);

    final double paddingBaseDaTela =
        ResponsividadeUtil.getValorPaddingTela(context);

    return Padding(
      padding: EdgeInsets.only(right: paddingBaseDaTela, left: 36, bottom: 4),
      child: Card(
        elevation: 3,
        shadowColor: Constants.accent,
        color: Constants.primariaContraste,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        mensagem,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize:
                              ViewPortUtil(context).propriedades.tamanhoFonte,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    dataFormatada,
                    style: TextStyle(
                        fontSize:
                            ViewPortUtil(context).propriedades.tamanhoFonte *
                                0.75,
                        color: Constants.primaria.shade200),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
