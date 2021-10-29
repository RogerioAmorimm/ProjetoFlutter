import 'package:dio/dio.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/modulos/mensagens/enity/enviar_mensagem_entity.dart';
import 'package:projetoflutter/modulos/mensagens/enity/mensagens_entity.dart';
import 'package:projetoflutter/utils/http/cliente_http.dart';

class MensagemService {
  Future<List<Mensagens>> getTodasMensagens(
      String remetenteId, String destinatarioId, int page) async {
    try {
      final client = await ClientHttp.getClient();
      final response = await client
          .get('Mensagem/getTodasMensagens/$remetenteId/$destinatarioId/$page');
      final mensagens = <Mensagens>[];
      if (response.data['data'] != null)
        response.data['data'].forEach((v) {
          mensagens.add(Mensagens.fromJson(v));
        });
      return mensagens.reversed.toList();
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Mensagens>> getTodasMensagensPorFiltro(String remetenteId,
      String destinatarioId, int page, String filtro) async {
    try {
      final client = await ClientHttp.getClient();
      final response = await client.get(
          'Mensagem/getTodasMensagensPorFiltro/$remetenteId/$destinatarioId/$page/$filtro');

      final mensagens = <Mensagens>[];
      if (response.data['data']!=null)
        response.data['data'].forEach((v) {
          mensagens.add(Mensagens.fromJson(v));
        });
      return mensagens.reversed.toList();
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  Future enviarMensagem(String remetenteId, String mensagem) async {
    try {
      final parametro = EnviarMensagemEntity(
        remetenteId,
        mensagem,
        locator<CardStore>().getCard()!.id,
      ).toJson();
      final client = await ClientHttp.getClient();
      await client.post('Mensagem/enviarMensagem', data: parametro);
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
