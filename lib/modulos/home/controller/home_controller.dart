import 'package:mobx/mobx.dart';
import 'package:projetoflutter/core/exception/gerenciador_erro.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/enum_status_request.dart';

part 'home_controller.g.dart';

class HomeController extends _HomeController with _$HomeController {}

abstract class _HomeController with Store {
  @observable
  ObservableFuture<bool>? observer;
  @observable
  bool? dadosCarregados;
  @observable
  String? erroProcessamento;

  @computed
  StatusRequest get status {
    if (observer == null || observer!.status == FutureStatus.rejected) {
      return StatusRequest.inicial;
    }
    return observer!.status == FutureStatus.pending
        ? StatusRequest.processando
        : StatusRequest.finalizado;
  }

  Future<bool> _carregar() async => true;
  @action
  Future carregarDadosHome() async {
    erroProcessamento = null;
    try {
      observer = ObservableFuture(_carregar());
      dadosCarregados = await observer;
    } catch (error) {
      erroProcessamento = error is ValidacaoServer
          ? error.mensagem
          : Constants.mensagemErroPadrao;

      await GerenciadorDeErro.trate(error);
    }
  }
}
