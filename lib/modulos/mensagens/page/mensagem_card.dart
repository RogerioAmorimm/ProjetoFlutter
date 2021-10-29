import 'package:flutter/material.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/responsividade/responsividade_util.dart';
import 'package:projetoflutter/utils/responsividade/view_port_util.dart';

class MensagemCard extends StatelessWidget {
  final String mensagem;
  final String origem;
  const MensagemCard({
    required this.mensagem,
    required this.origem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingBaseDaTela =
        ResponsividadeUtil.getValorPaddingTela(context);
    final usuarioLogado = locator<UsuarioController>().getUsuarioLogado()!;
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
                        textAlign: usuarioLogado.id == origem
                            ? TextAlign.right
                            : TextAlign.left,
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
                mainAxisAlignment: usuarioLogado.id == origem
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    usuarioLogado.id == origem
                        ? locator<CardStore>().getCard()!.nome
                        : usuarioLogado.nome,
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
