import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:projetoflutter/core/exception/gerenciador_erro.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/nova_solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/tipos_de_solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/service/solicitacao_service.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/enum_status_request.dart';

part 'nova_solicitacao_controller.g.dart';

class NovaSolicitacaoController = _NovaSolicitacaoControllerBase
    with _$NovaSolicitacaoController;

abstract class _NovaSolicitacaoControllerBase with Store {
  @observable
  List<TiposDeSolicitacaoEntity>? tiposDeSolicitacao;
  @observable
  TiposDeSolicitacaoEntity? tipoDeSolicitacaoSelecionada;
  @observable
  TextEditingController motivo = TextEditingController();
  @observable
  String? erroProcessamento;
  @observable
  ObservableFuture<List<TiposDeSolicitacaoEntity>>? tiposDeSolicitacaoObserver;

  @computed
  StatusRequest get status {
    if (tiposDeSolicitacaoObserver == null ||
        tiposDeSolicitacaoObserver!.status == FutureStatus.rejected) {
      return StatusRequest.inicial;
    }
    return tiposDeSolicitacaoObserver!.status == FutureStatus.pending
        ? StatusRequest.processando
        : StatusRequest.finalizado;
  }

  @action
  Future carregueTiposDeSolicitacao() async {
    erroProcessamento = null;

    try {
      final service = locator<SolicitacaoService>();

      tiposDeSolicitacaoObserver =
          ObservableFuture(service.getTiposDeSolicitacao());
      tiposDeSolicitacao = await tiposDeSolicitacaoObserver;
      if (tiposDeSolicitacao!.isNotEmpty) {
        tipoDeSolicitacaoSelecionada = tiposDeSolicitacao!.first;
      }
    } catch (error) {
      erroProcessamento = error is ValidacaoServer
          ? error.mensagem
          : Constants.mensagemErroPadrao;

      await GerenciadorDeErro.trate(error);
    }
  }

  @action
  void setTipoDeSolicitacaoSelecionada(String chave) {
    tipoDeSolicitacaoSelecionada = tiposDeSolicitacao!.firstWhere(
        (element) => element.descricao == chave,
        orElse: () => TiposDeSolicitacaoEntity(id: '', descricao: ''));
  }

  @action
  String? validarTiposSolicitacao(dynamic tipoSolicitacao) {
    if (tipoSolicitacao == null || tipoSolicitacao.isEmpty) {
      return 'Informe um Tipo de Solicitação';
    }
    return null;
  }

  @action
  String? validarMotivoSolicitacao(dynamic motivoSolicitacao) {
    if (motivoSolicitacao == null || motivoSolicitacao.isEmpty) {
      return 'Informe um Motivo da Solicitação';
    }
    return null;
  }

  @action
  void limpaTelaDeNovaSolicitacao() {
    motivo.text = '';
    if (tiposDeSolicitacao!.isNotEmpty) {
      tipoDeSolicitacaoSelecionada = tiposDeSolicitacao!.first;
    }
  }

  @action
  Future novaSolicitacao(NovaSolicitacaoEntity novaSolicitacao) async {
    erroProcessamento = null;

    try {
      final service = locator<SolicitacaoService>();
      await service.postNovaSolicitacao(novaSolicitacao);
    } catch (error) {
      erroProcessamento = error is ValidacaoServer
          ? error.mensagem
          : Constants.mensagemErroPadrao;

      await GerenciadorDeErro.trate(error);
    }
  }
}
