import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:projetoflutter/core/exception/gerenciador_erro.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/modulos/mensagens/enity/mensagens_entity.dart';
import 'package:projetoflutter/modulos/mensagens/service/mensagem_service.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/enum_status_request.dart';

part 'mensagem_controller.g.dart';

class MensagemController extends _MensagemControllerBase
    with _$MensagemController {}

abstract class _MensagemControllerBase with Store {
  final PagingController<int, Mensagens> pagingController =
      PagingController(firstPageKey: 1);
  static const pageSize = 10;

  @action
  void initPaginacao() {
    // ignore: unnecessary_lambdas 
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    
  }

  @action
  void atualizar() {
    pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final controller = locator<MensagemController>();
      final newItems = await controller.carregarNovaPaginaMensagens(pageKey);
      final isLastPage = newItems!.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @observable
  String filtroDeTexto = '';

  @observable
  TextEditingController textEditingController = TextEditingController();

  @observable
  String? erroProcessamento;

  @observable
  ObservableFuture<List<Mensagens>>? listaDeMensagensObserver;

  @observable
  List<Mensagens>? listaDeMensagens;

  @computed
  StatusRequest get status {
    if (listaDeMensagensObserver == null ||
        listaDeMensagensObserver!.status == FutureStatus.rejected) {
      return StatusRequest.inicial;
    }
    return StatusRequest.finalizado;
  }

  @action
  Future<List<Mensagens>?> carregarNovaPaginaMensagens(int page) async {
    erroProcessamento = null;
    try {
      final service = locator<MensagemService>();
      final cardsStore = locator<CardStore>();
      final usuarioLogado = locator<UsuarioController>().getUsuarioLogado()!;
      if (filtroDeTexto != '') {
        return await service.getTodasMensagensPorFiltro(
            usuarioLogado.id, cardsStore.getCard()!.id, page, filtroDeTexto);
      } else {
        return await service.getTodasMensagens(
          usuarioLogado.id,
          cardsStore.getCard()!.id,
          page,
        );
      }
    } catch (error) {
      erroProcessamento = error is ValidacaoServer
          ? error.mensagem
          : Constants.mensagemErroPadrao;
      await GerenciadorDeErro.trate(error);
    }
  }

  @action
  Future<void> adicionarNovaMensagem() async {
    erroProcessamento = null;

    try {
      if (textEditingController.text.isNotEmpty) {
        final service = locator<MensagemService>();
        final usuarioLogado = locator<UsuarioController>().getUsuarioLogado();
        await service.enviarMensagem(
          usuarioLogado!.id,
          textEditingController.text,
        );
        textEditingController.text = '';
      }
    } catch (error) {
      erroProcessamento = error is ValidacaoServer
          ? error.mensagem
          : Constants.mensagemErroPadrao;
      await GerenciadorDeErro.trate(error);
    }
  }
}
