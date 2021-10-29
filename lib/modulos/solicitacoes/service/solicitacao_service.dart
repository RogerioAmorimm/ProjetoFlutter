import 'package:dio/dio.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/nova_solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/solicitacao_entity.dart';
import 'package:projetoflutter/modulos/solicitacoes/enity/tipos_de_solicitacao_entity.dart';

final mockSolicatacoes = [
  {
    'id': 1,
    'data': DateTime.now().toString(),
    'status': '1',
    'solicitanteId': '1',
    'solicitante': 'Rogerio',
    'motivo': 'teste teste',
    'tipo': {'id': '1', 'descricao': 'teste desc'}
  },
  {
    'id': 2,
    'data': DateTime.now().toString(),
    'status': '1',
    'solicitanteId': '1',
    'solicitante': 'Rogerio',
    'motivo': 'teste teste 2',
    'tipo': {'id': '1', 'descricao': 'teste desc'}
  },
  {
    'id': 3,
    'data': DateTime.now().toString(),
    'status': '1',
    'solicitanteId': '1',
    'solicitante': 'Rogerio',
    'motivo': 'teste teste 3',
    'tipo': {'id': '1', 'descricao': 'teste desc'}
  },
];
final mockTiposSolicatacoes = [
  {'id': '1', 'descricao': 'teste desc'},
  {'id': '2', 'descricao': 'teste desc'},
  {'id': '3', 'descricao': 'teste desc'}
];

class SolicitacaoService {
  Future<List<SolicitacaoEntity>> getUltimasDezSolicitacoes(String id) async {
    try {
      // final client = await ClientHttp.getClient();
      // final response = await client.get('');
      final solicitacoes = <SolicitacaoEntity>[];

      // if (response.data != null) {
      //   for (final item in response.data) {
      //     solicitacoes.add(SolicitacaoEntity.fromJson(item));
      //   }
      // }

      mockSolicatacoes.forEach((element) {
        solicitacoes.add(SolicitacaoEntity.fromJson(element));
      });

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
      // final client = await ClientHttp.getClient();
      // final response = await client.get('/v1/solicitacao/tipos/');

      // if (response.data != null) {
      //   for (final item in response.data) {
      //     listaRetorno.add(TiposDeSolicitacaoEntity.fromJson(item));
      //   }
      // }
      mockTiposSolicatacoes.forEach((element) {
        listaRetorno.add(TiposDeSolicitacaoEntity.fromJson(element));
      });
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
      // final client = await ClientHttp.getClient();
      // await client.post('/v1/solicitacao', data: novaSolicitacao.toJson());
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
