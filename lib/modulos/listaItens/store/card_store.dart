import 'package:mobx/mobx.dart';
import 'package:projetoflutter/modulos/listaItens/entity/card_entity.dart';

part 'card_store.g.dart';

class CardStore = _CardStoreBase
    with _$CardStore;

abstract class _CardStoreBase with Store {
  @observable
  CardEntity? _cardSelecionado;
  @action
  void mudarCard(CardEntity card) => _cardSelecionado = card;
  @action
  CardEntity? getCard() => _cardSelecionado;
  @action
  void limpar() {
    _cardSelecionado = null;
  }
}