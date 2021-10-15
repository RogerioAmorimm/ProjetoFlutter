import 'package:flutter/material.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/responsividade/responsividade_util.dart';
import 'item_foto_component.dart';
import 'item_page.dart';

class CardComponente extends StatelessWidget {
  const CardComponente({required this.cardStore, key}) : super(key: key);
  final CardStore cardStore;

  @override
  Widget build(BuildContext context) {
    final store = cardStore;
    final tamanhoImagem = ResponsividadeUtil.getTamanhoImagem(context);
    final card = store.getCard();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: tamanhoImagem.height,
            width: tamanhoImagem.width,
            child: card!.urlFotoPerfil.isEmpty
                ? Image.asset(
                    Constants.logo,
                    fit: BoxFit.fill,
                  )
                : ItemFotoComponent(
                    alturaImagem: tamanhoImagem.height,
                    url: card.urlFotoPerfil,
                    bordaImagem: null,
                  ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemPage(
                Icons.school,
                card.nome,
                tamanhoFonte: ResponsividadeUtil.getTamanhoFonte(context),
                tamanhoIcone: ResponsividadeUtil.getTamanhoIconeItem(context),
                padding: const EdgeInsets.only(left: 8, top: 8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
