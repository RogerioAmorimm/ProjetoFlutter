import 'package:dio/dio.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/modulos/mensagens/enity/enviar_mensagem_entity.dart';
import 'package:projetoflutter/modulos/mensagens/enity/mensagem_entity.dart';
import 'package:projetoflutter/modulos/mensagens/enity/mensagens_entity.dart';
import 'package:projetoflutter/utils/http/cliente_http.dart';

class MensagemService {
  final msgMock = [
    {
      'id': 1,
      'usuario': 'Rogério',
      'mensagem': 'testestestedadadajdada',
      'dataHora': DateTime.now().toString()
    },
    {
      'id': 2,
      'usuario': 'Teste-1',
      'mensagem': 'testestestedadadajdada',
      'dataHora': DateTime.now().toString()
    },
    {
      'id': 3,
      'usuario': 'Teste-2',
      'mensagem': 'testestestedadadajdada',
      'dataHora': DateTime.now().toString()
    },
  ];
  Future<List<Mensagens>> getTodasMensagens(int id, int page) async {
    try {
      final client = await ClientHttp.getClient();
      final response = await client.get('');
      final mensagens = <Mensagens>[];
      msgMock.forEach((v) {
        mensagens.add(Mensagens.fromJson(v));
      });

      return mensagens;
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Mensagens>> getTodasMensagensPorFiltro(
    int id,
    String filtro,
    int page,
  ) async {
    try {
      final client = await ClientHttp.getClient();
      final response = await client.get('');
      final mensagens = <Mensagens>[];
      msgMock.forEach((v) {
        mensagens.add(Mensagens.fromJson(v));
      });
      return mensagens;
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Mensagens>> enviarMensagem(
    int id,
    String mensagem,
  ) async {
    try {
      final parametro = EnviarMensagemEntity(
        id,
        mensagem,
      ).toJson();
      final client = await ClientHttp.getClient();
      final response = await client.post('', data: parametro);
      final mensagemEntity = MensagemEntity.fromJson(response.data);
      final mensagens = <Mensagens>[];
      msgMock.forEach((v) {
        mensagens.add(Mensagens.fromJson(v));
      });
      return mensagemEntity.mensagens ?? mensagens;
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
