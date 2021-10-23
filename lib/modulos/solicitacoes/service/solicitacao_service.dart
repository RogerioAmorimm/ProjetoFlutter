import 'package:dio/dio.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/nova_solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/tipos_de_solicitacao_entity.dart';
import 'package:projetoflutter/utils/http/cliente_http.dart';

class SolicitacaoService {
  Future<List<SolicitacaoEntity>> getUltimasDezSolicitacoes(int id) async {
    try {
      final client = await ClientHttp.getClient();
      final response =
          await client.get('');
      final solicitacoes = <SolicitacaoEntity>[];

      if (response.data != null) {
        for (final item in response.data) {
          solicitacoes.add(SolicitacaoEntity.fromJson(item));
        }
      }
      return solicitacoes;
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<TiposDeSolicitacaoEntity>> getTiposDeSolicitacao() async {
    try {
      final List<TiposDeSolicitacaoEntity> listaRetorno = [];
      final client = await ClientHttp.getClient();
      final response = await client.get('/v1/solicitacao/tipos/');

      if (response.data != null) {
        for (final item in response.data) {
          listaRetorno.add(TiposDeSolicitacaoEntity.fromJson(item));
        }
      }
      return listaRetorno;
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  Future postNovaSolicitacao(NovaSolicitacaoEntity novaSolicitacao) async {
    try {
      final client = await ClientHttp.getClient();
      await client.post('/v1/solicitacao', data: novaSolicitacao.toJson());
      
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
