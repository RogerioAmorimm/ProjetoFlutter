import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/core/exception/gerenciador_erro.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/entity/card_entity.dart';
import 'package:projetoflutter/modulos/listaItens/service/card_service.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/enum_status_request.dart';
import 'package:projetoflutter/utils/responsividade/view_port_util.dart';

part 'card_controller.g.dart';

class CardController = _CardControllerBase with _$CardController;

abstract class _CardControllerBase with Store {
  @observable
  ObservableFuture<List<CardEntity>>? cardsObserver;

  @observable
  List<CardEntity>? cards;

  @observable
  String? erroProcessamento;

  @computed
  StatusRequest get status {
    if (cardsObserver == null ||
        cardsObserver!.status == FutureStatus.rejected) {
      return StatusRequest.inicial;
    }
    return cardsObserver!.status == FutureStatus.pending
        ? StatusRequest.processando
        : StatusRequest.finalizado;
  }

  Future<void> carregaCards() async {
    int indice = 0;
    erroProcessamento = null;

    try {
      final usuarioController = locator<UsuarioController>();
      final service = locator<CardService>();
      final drawerController = locator<DrawerNavegacaoController>();

      cardsObserver = ObservableFuture(
        service.getCardPorId(
          usuarioController.getUsuarioLogado()!.id,
        ),
      );

      cards = await cardsObserver;
      if (cards!.length <= 1) {
        indice = 1;
        locator<CardStore>().mudarCard(cards!.first);
      }
      drawerController.mudarIndex(indice);
    } catch (error) {
      erroProcessamento = error is ValidacaoServer
          ? error.mensagem
          : Constants.mensagemErroPadrao;

      await GerenciadorDeErro.trate(error);
    }
  }

  @action
  void obterProximosCards() {
    cardsObserver = ObservableFuture(
        Future.value(List.from(cards!.toList())..addAll(cards!.toList())));
  }

  @action
  List<Widget> listaDeCards() {
    final List<Widget> listaRetornro = [];

    for (final card in cards!) {
      listaRetornro.add(Container());
    }

    return listaRetornro;
  }

  Size tamanhoImagem(context) {
    if (ViewPortUtil(context).inicio == ViewPortUtil.minimo.fim) {
      return const Size(300, 180);
    }
    return const Size(300, 200);
  }
}
