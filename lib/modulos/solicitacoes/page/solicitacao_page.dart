import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetoflutter/components/cardPage/card_componente.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/components/indicador_processamento.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/modulos/solicitacoes/controller/solicitacao_controller.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/enum_status_request.dart';
import 'package:projetoflutter/utils/responsividade/responsividade_util.dart';
import 'package:projetoflutter/utils/routers/transition_route_observer.dart';

import 'list_solicitacao_componente.dart';

class SolicitacaoPage extends StatefulWidget {
  final SolicitacaoController solicitacaoController;
  const SolicitacaoPage({required this.solicitacaoController, key})
      : super(key: key);
  static const String routerName = '/solicitacao';

  @override
  _SolicitacaoPageState createState() => _SolicitacaoPageState();
}

class _SolicitacaoPageState extends State<SolicitacaoPage>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  @override
  Widget build(BuildContext context) {
    final SolicitacaoController solicitacaoController =
        widget.solicitacaoController;
    solicitacaoController.carregueUltimasSolicitacoes();

    return Observer(
      builder: (_) {
        if (solicitacaoController.erroProcessamento != null) {
          if (solicitacaoController.solicitacoesObservable == null) {
            return erroProcessamentoRetentativa(
                solicitacaoController.erroProcessamento ?? '',
                () => {solicitacaoController.carregueUltimasSolicitacoes()},
                context);
          } else {
            mostrarFlushbarErro(
                context, solicitacaoController.erroProcessamento.toString());
            return page(solicitacaoController);
          }
        }

        switch (solicitacaoController.status) {
          case StatusRequest.inicial:
            return processando();
          case StatusRequest.processando:
            return processando();
          case StatusRequest.finalizado:
            return page(solicitacaoController);
        }
      },
    );
  }

  LayoutBuilder page(SolicitacaoController solicitacaoController) {
    final drawerController = locator<DrawerNavegacaoController>();

    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final EdgeInsets paddingDaTela =
            ResponsividadeUtil.getPaddingTela(context);

        return Scaffold(
          body: Container(
            padding: paddingDaTela,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CardComponente(
                    cardStore: locator<CardStore>(),
                  ),
                ),
                ...solicitacaoController.solicitacoes!
                    .map((solicitacao) => ListSolicitacoesComponente(
                          solicitacao: solicitacao,
                        ))
                    .toList()
              ],
            ),
          ),
          floatingActionButton: Container(
            decoration: BoxDecoration(
                color: Constants.primaria,
                borderRadius: BorderRadius.circular(36)),
            child: IconButton(
              iconSize: 36,
              color: Constants.primariaContraste,
              icon: const Icon(
                Icons.add,
              ),
              onPressed: () {
                drawerController.mudarIndex(6);
              },
            ),
          ),
        );
      },
    );
  }
}
