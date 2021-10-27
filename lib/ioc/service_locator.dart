import 'package:get_it/get_it.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/core/login/controller/login_controller.dart';
import 'package:projetoflutter/core/usuario/controller/usuario_controller.dart';
import 'package:projetoflutter/modulos/listaItens/controller/card_controller.dart';
import 'package:projetoflutter/modulos/listaItens/service/card_service.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/modulos/mensagens/controller/mensagem_controller.dart';
import 'package:projetoflutter/modulos/mensagens/service/mensagem_service.dart';
import 'package:projetoflutter/modulos/solicitacoes/controller/nova_solicitacao_controller.dart';
import 'package:projetoflutter/modulos/solicitacoes/controller/solicitacao_controller.dart';
import 'package:projetoflutter/modulos/solicitacoes/service/solicitacao_service.dart';
import 'package:projetoflutter/utils/http/cliente_http.dart';

final locator = GetIt.instance;
void setUpLocator() {
  locator.registerSingleton<UsuarioController>(UsuarioController());
  locator.registerSingleton<ClientHttp>(ClientHttp());
  locator.registerSingleton<LoginController>(LoginController());
  locator.registerSingleton<DrawerNavegacaoController>(
      DrawerNavegacaoController());
  locator.registerSingleton<CardService>(CardService());
  locator.registerSingleton<CardStore>(CardStore());
  locator.registerSingleton<CardController>(CardController());
  locator.registerSingleton<MensagemService>(MensagemService());
  locator.registerSingleton<MensagemController>(MensagemController());
  locator.registerSingleton<SolicitacaoService>(SolicitacaoService());
  locator.registerSingleton<NovaSolicitacaoController>(
      NovaSolicitacaoController());
  locator.registerSingleton<SolicitacaoController>(SolicitacaoController());
}
