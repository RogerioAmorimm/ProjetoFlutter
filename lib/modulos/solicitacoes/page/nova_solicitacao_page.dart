import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:projetoflutter/components/barra_navegacao_inferior_formulario.dart';
import 'package:projetoflutter/components/cardPage/card_componente.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/components/indicador_processamento.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/core/usuario/entity/usuario_entity.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/modulos/solicitacoes/controller/nova_solicitacao_controller.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/nova_solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/page/modal_solicitacao.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/enum_status_request.dart';
import 'package:projetoflutter/utils/responsividade/responsividade_util.dart';
import 'package:projetoflutter/utils/routers/transition_route_observer.dart';
import 'package:search_choices/search_choices.dart';

class NovaSolicitacaoPage extends StatefulWidget {
  final NovaSolicitacaoController novaSolicitacaoController;
  const NovaSolicitacaoPage({required this.novaSolicitacaoController, key})
      : super(key: key);
  static const String routerName = 'nova-solicitacao';

  @override
  _NovaSolicitacaoPageState createState() => _NovaSolicitacaoPageState();
}

class _NovaSolicitacaoPageState extends State<NovaSolicitacaoPage>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  UsuarioEntity solicitante = locator<UsuarioController>().getUsuarioLogado()!;
  CardStore cardStore = locator<CardStore>();
  DrawerNavegacaoController drawerController =
      locator<DrawerNavegacaoController>();
  bool estaSalvando = false;

  @override
  Widget build(BuildContext context) {
    final NovaSolicitacaoController novaSolicitacaoController =
        widget.novaSolicitacaoController;

    novaSolicitacaoController.carregueTiposDeSolicitacao();

    return Observer(
      builder: (context) {
        if (novaSolicitacaoController.erroProcessamento != null) {
          if (novaSolicitacaoController.tiposDeSolicitacaoObserver == null) {
            return erroProcessamentoRetentativa(
                novaSolicitacaoController.erroProcessamento ?? '',
                () => {novaSolicitacaoController.carregueTiposDeSolicitacao()},
                context);
          } else {
            mostrarFlushbarErro(context,
                novaSolicitacaoController.erroProcessamento.toString());
            return page(novaSolicitacaoController);
          }
        }

        switch (novaSolicitacaoController.status) {
          case StatusRequest.inicial:
            return processando();
          case StatusRequest.processando:
            return processando();
          case StatusRequest.finalizado:
            return page(novaSolicitacaoController);
        }
      },
    );
  }

  Widget page(NovaSolicitacaoController novaSolicitacaoController) {
    final _formKey = GlobalKey<FormState>();

    final List<DropdownMenuItem> tiposSolicitacao =
        novaSolicitacaoController.tiposDeSolicitacao!
            .map((tipoSolicitacao) => DropdownMenuItem(
                  value: tipoSolicitacao.descricao,
                  child: Text(tipoSolicitacao.descricao),
                ))
            .toList();

    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final EdgeInsets paddingDaTela =
            ResponsividadeUtil.getPaddingTela(context);

        return Scaffold(
          body: ListView(
            padding: paddingDaTela,
            children: [
              CardComponente(
                cardStore: cardStore,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  decoration: BoxDecoration(
                      color: Constants.accent.shade100,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Constants.accent.shade200)),
                  padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Nova Solicitação',
                      style: TextStyle(
                          color: Constants.primaria.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Tipo de Solicitação',
                          style: TextStyle(color: Constants.primaria)),
                      SearchChoices.single(
                        validator: (value) => novaSolicitacaoController
                            .validarTiposSolicitacao(value),
                        displayClearIcon: false,
                        closeButton: 'Fechar',
                        items: tiposSolicitacao,
                        value: novaSolicitacaoController
                            .tipoDeSolicitacaoSelecionada!.descricao,
                        hint: 'Selecione uma opção',
                        searchHint: 'Tipo',
                        onChanged: (value) {
                          novaSolicitacaoController
                              .setTipoDeSolicitacaoSelecionada(value);
                        },
                        isExpanded: true,
                      ),
                      ResponsividadeUtil.getEspacamentoEntreComponentes(
                          context),
                      const Text('Motivo da Solicitação',
                          style: TextStyle(color: Constants.primaria)),
                      TextFormField(
                        validator: (value) => novaSolicitacaoController
                            .validarMotivoSolicitacao(value),
                        autocorrect: true,
                        controller: novaSolicitacaoController.motivo,
                        maxLength: 200,
                        maxLines: 5,
                        decoration: const InputDecoration(
                            hintText: 'Digite aqui o motivo da solicitação...',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 4),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BarraNavegaoInferiorFormulario(
              formKey: _formKey,
              retornoVoltar: _voltar,
              retornoSalvar: _salvar),
        );
      },
    );
  }

  void _voltar() {
    drawerController.mudarIndex(2);
  }

  void _salvar() {
    _mostrarConfirmacaoSolicitacao();
  }

  Future<void> _mostrarConfirmacaoSolicitacao() async {
    final controller = widget.novaSolicitacaoController;
    final entidade = controller.tipoDeSolicitacaoSelecionada!;
    return showDialog(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return ModalSolicitacao(
                  titulo: entidade.descricao,
                  dados: {
                    'Data da Solicitação: ':
                        '${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                    'Solicitante: ': solicitante.nome,
                    'Motivo: ': controller.motivo.text,
                  },
                  botaoAdicional: ElevatedButton(
                    onPressed: () {
                      if (!estaSalvando) {
                        setState(() {
                          estaSalvando = true;
                        });

                        controller
                            .novaSolicitacao(NovaSolicitacaoEntity(
                                id: cardStore.getCard()!.id,
                                motivo: widget
                                    .novaSolicitacaoController.motivo.text,
                                solicitanteId: solicitante.id,
                                tipoSolicitacaoId: entidade.id))
                            .then((value) {
                          Navigator.pop(context);

                          setState(() {
                            estaSalvando = false;
                          });

                          if (widget.novaSolicitacaoController
                                  .erroProcessamento !=
                              null) {
                            mostrarFlushbarErro(
                                context,
                                widget
                                    .novaSolicitacaoController.erroProcessamento
                                    .toString());
                          } else {
                            controller.limpaTelaDeNovaSolicitacao();
                            mostrarFlushbarSucesso(
                                context, 'Solicitação enviada com sucesso.');
                            drawerController.mudarIndex(2);
                          }
                        });
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 8),
                        child: Center(
                            child: estaSalvando
                                ? Container(
                                    child: const SpinKitRing(
                                      color: Colors.white,
                                      size: 20,
                                      lineWidth: 3,
                                    ),
                                  )
                                : const Text(
                                    'Confirmar Envio',
                                    textAlign: TextAlign.center,
                                  ))),
                  ));
            },
          );
        });
  }
}
