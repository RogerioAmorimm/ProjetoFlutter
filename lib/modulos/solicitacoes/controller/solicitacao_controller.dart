import 'package:mobx/mobx.dart';
import 'package:projetoflutter/core/exception/gerenciador_erro.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/service/solicitacao_service.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/enum_status_request.dart';
part 'solicitacao_controller.g.dart';

class SolicitacaoController = _SolicitacaoControllerBase
    with _$SolicitacaoController;

abstract class _SolicitacaoControllerBase with Store {
  @observable
  ObservableFuture<List<SolicitacaoEntity>>? solicitacoesObservable;
  List<SolicitacaoEntity>? solicitacoes;

  @computed
  StatusRequest get status {
    if (solicitacoesObservable == null ||
        solicitacoesObservable!.status == FutureStatus.rejected) {
      return StatusRequest.inicial;
    }
    return solicitacoesObservable!.status == FutureStatus.pending
        ? StatusRequest.processando
        : StatusRequest.finalizado;
  }

  @observable
  String? erroProcessamento;

  @action
  Future<void> carregueUltimasSolicitacoes() async {
    erroProcessamento = null;
    final service = locator<SolicitacaoService>();
    final cardStore = locator<CardStore>();

    try {
      erroProcessamento = null;
      solicitacoesObservable = ObservableFuture(
        Future.value(
          await service.getUltimasDezSolicitacoes(
            cardStore.getCard()?.id ?? '',
          ),
        ),
      );
      solicitacoes = await solicitacoesObservable;
    } catch (error) {
      erroProcessamento = error is ValidacaoServer
          ? error.mensagem
          : Constants.mensagemErroPadrao;

      await GerenciadorDeErro.trate(error);
    }
  }
}
