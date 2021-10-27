import 'package:projetoflutter/modulos/listaItens/entity/card_entity.dart';

final jsonMock = [
  {'nome': 'card-1', 'foto': '', 'id': 1},
  {'nome': 'card-2', 'foto': '', 'id': 2},
  {'nome': 'card-3', 'foto': '', 'id': 3}
];

class CardService {
  Future<List<CardEntity>> getCardPorId(String id) async {
    final cards = <CardEntity>[];
    jsonMock.forEach((element) {
      cards.add(CardEntity.fromJson(element));
    });
    return cards;
  }
}
