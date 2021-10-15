import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projetoflutter/components/cardPage/item_foto_component.dart';
import 'package:projetoflutter/components/cardPage/item_page.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/controller/card_controller.dart';
import 'package:projetoflutter/modulos/listaItens/entity/card_entity.dart';
import 'package:projetoflutter/modulos/listaItens/store/card_store.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/responsividade/media_query_util.dart';
import 'package:projetoflutter/utils/responsividade/responsividade_util.dart';
import 'package:projetoflutter/utils/responsividade/view_port_util.dart';

class ItemCardPage extends StatelessWidget {
  const ItemCardPage(this.cardController, {key, this.card}) : super(key: key);
  final CardEntity? card;
  final CardController cardController;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (
          BuildContext context,
          BoxConstraints constraints,
        ) {
          final altura = MediaQueryUtil.alturaTotal(context);

          final double alturaImagem = altura / 3;
          const double alturaIdealDados = 300;
          final double alturaIdealDoCard = alturaImagem + alturaIdealDados;
          final double larguraIdealDoCard = alturaIdealDoCard * 0.75;

          final double alturaIdeal = constraints.maxHeight >= alturaIdealDoCard
              ? alturaIdealDoCard
              : constraints.maxHeight;
          final double larguraIdeal = constraints.maxWidth > larguraIdealDoCard
              ? larguraIdealDoCard
              : constraints.maxWidth;

          final espacamentoLateral = (constraints.maxWidth - larguraIdeal) / 2;
          final espacamentoVertical = (constraints.maxHeight - alturaIdeal) / 2;

          final componentesDados = [
            ItemPage(
              Icons.home,
              card!.nome,
              tamanhoFonte: ResponsividadeUtil.getTamanhoFonte(context),
              tamanhoIcone: ResponsividadeUtil.getTamanhoIcone(context),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8))),
                  onPressed: () {
                    locator<CardStore>().mudarCard(card!);
                    locator<DrawerNavegacaoController>().mudarIndex(1);
                  },
                  child: Text(
                    'Ver informações',
                    style: TextStyle(
                        fontSize:
                            ViewPortUtil(context).propriedades.tamanhoFonte),
                  ),
                ),
              ),
            ),
          ];

          const circunferenciaBasica = Radius.circular(4);
          const bordaImagem = BorderRadius.only(
              topLeft: circunferenciaBasica, topRight: circunferenciaBasica);

          final componenteImage = SizedBox(
            height: alturaImagem,
            child: ClipRRect(
              borderRadius: bordaImagem,
              child: card!.urlFotoPerfil.isEmpty
                  ? Image.asset(
                      Constants.logo,
                      fit: BoxFit.fill,
                    )
                  : ItemFotoComponent(
                      alturaImagem: alturaImagem,
                      bordaImagem: bordaImagem,
                      url: card!.urlFotoPerfil,
                    ),
            ),
          );

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: espacamentoLateral,
              vertical: espacamentoVertical,
            ),
            child: Card(
              elevation: 8,
              shadowColor: Constants.accent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [componenteImage, ...componentesDados],
              ),
            ),
          );
        },
      );
}
