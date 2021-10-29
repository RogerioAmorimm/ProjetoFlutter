import 'package:dio/dio.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/modulos/listaItens/entity/card_entity.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/cliente_http.dart';

class CardService {
  Future<List<CardEntity>> getCardPorId(String id) async {
    final cards = <CardEntity>[];
    try {
      final client = await ClientHttp.getClient();
      final response = await client.get('contato/listarTodos/$id');

      if (response.data['data'] != null) {
        response.data['data']
            .forEach((card) => cards.add(CardEntity.fromJson(card)));
      }
      return cards;
    } on DioError catch (error, _) {
      throw ValidacaoServer.fromMap(error.response!.data);
    } on Exception {
      throw Exception(Constants.mensagemErroInterno);
    } catch (error) {
      throw Exception(Constants.mensagemErroInterno);
    }
  }
}
