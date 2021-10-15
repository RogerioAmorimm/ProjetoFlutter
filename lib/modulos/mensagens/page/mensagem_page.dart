import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:projetoflutter/components/cardPage/card_componente.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/modulos/mensagens/controller/mensagem_controller.dart';
import 'package:projetoflutter/modulos/mensagens/enity/mensagens_entity.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/responsividade/responsividade_util.dart';
import 'package:projetoflutter/utils/responsividade/view_port_util.dart';
import 'package:projetoflutter/utils/routers/transition_route_observer.dart';
import 'controle_filtro_mensagem_componente.dart';
import 'mensagem_card.dart';

class MensagemPage extends StatefulWidget {
  static const String routerName = '/mensagem';

  final MensagemController controller;
  final CardComponente? cardComponente;
  final ControleFiltroMensagemComponente? controleFiltroMensagemComponente;

  const MensagemPage({
    required this.controller,
    required this.cardComponente,
    required this.controleFiltroMensagemComponente,
    key,
  }) : super(key: key);

  @override
  _MensagemPageState createState() => _MensagemPageState();
}

class _MensagemPageState extends State<MensagemPage>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  bool mensagemSendoEnviada = false;

  @override
  void initState() {
    widget.controller.initPaginacao();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    return page(controller, context);
  }

  LayoutBuilder page(MensagemController controller, BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final double paddingBaseDaTela =
            ResponsividadeUtil.getValorPaddingTela(context);
        final Widget componenteDoCard = CardComponente(
          cardStore: locator<CardStore>(),
        );

        return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(paddingBaseDaTela,
                      paddingBaseDaTela, paddingBaseDaTela, 0),
                  child: componenteDoCard,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      paddingBaseDaTela, 0, paddingBaseDaTela, 0),
                  child: ControleFiltroMensagemComponente(
                    controller: controller,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: PagedListView<int, Mensagens>(
                    pagingController: controller.pagingController,
                    reverse: true,
                    builderDelegate: PagedChildBuilderDelegate<Mensagens>(
                      itemBuilder: (context, item, index) {
                        return MensagemCard(
                          data: item.dataHora,
                          mensagem: item.mensagem,
                          origem: item.usuario,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: buildMessageTextField(controller));
      },
    );
  }

  void envieMensagem(MensagemController controller) {
    setState(() {
      mensagemSendoEnviada = true;

      controller.adicionarNovaMensagem().then((_) {
        mensagemSendoEnviada = false;
        controller.textEditingController.clear();
        FocusScope.of(context).unfocus();
      }).catchError((_) {
        mensagemSendoEnviada = false;
      });
    });
  }

  Widget buildMessageTextField(MensagemController controller) {
    return Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(color: Constants.accent.shade200))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller.textEditingController,
              onEditingComplete: () {
                envieMensagem(controller);
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                hintText: 'Escreva aqui sua mensagem...',
                hintStyle: TextStyle(
                  fontSize: ViewPortUtil(context).propriedades.tamanhoFonte,
                  color: Constants.primaria.shade300,
                ),
              ),
              textInputAction: TextInputAction.send,
              style: TextStyle(
                  fontSize: ViewPortUtil(context).propriedades.tamanhoFonte,
                  color: Constants.primaria.shade900),
              onSubmitted: (_) {
                setState(() {
                  mensagemSendoEnviada = false;
                });
                if (!mensagemSendoEnviada) {
                  envieMensagem(controller);
                }
              },
            ),
          ),
          Container(
              padding: const EdgeInsets.all(8),
              width: 48,
              height: 48,
              child: Center(
                  child: mensagemSendoEnviada
                      ? const SpinKitRing(
                          color: Constants.primaria,
                          size: 30,
                          lineWidth: 3,
                        )
                      : InkWell(
                          borderRadius: BorderRadius.circular(50),
                          focusColor: Constants.accent,
                          splashColor: Constants.accent,
                          highlightColor: Constants.accent.shade200,
                          onTap: () {
                            if (!mensagemSendoEnviada) {
                              envieMensagem(controller);
                            }
                          },
                          child: Container(
                            child: const Icon(Icons.send,
                                color: Constants.primaria),
                          ),
                        )))
        ],
      ),
    );
  }
}
