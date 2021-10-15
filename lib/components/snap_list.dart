import 'package:flutter/material.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/responsividade/media_query_util.dart';
import 'package:projetoflutter/utils/responsividade/view_port_util.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:snaplist/snaplist_view.dart';

class SnapListCuston extends StatelessWidget {
  const SnapListCuston({
    required this.listaDeItens,
    required this.loadMore,
    Key? key,
  }) : super(key: key);
  final VoidCallback loadMore;
  final List<Widget> listaDeItens;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final espacamentoEntreCards = (MediaQuery.of(context).size.width -
                MediaQueryUtil.getSize(constraints, 80).width) /
            2;
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: SnapList(
                alignment: Alignment.topCenter,
                padding:
                    EdgeInsets.symmetric(horizontal: espacamentoEntreCards),
                sizeProvider: (index, data) =>
                    MediaQueryUtil.getSize(constraints, 80),
                separatorProvider: (index, data) =>
                    Size(espacamentoEntreCards, 10),
                positionUpdate: (index) {
                  if (index == listaDeItens.length - 1) {
                    loadMore();
                  }
                },
                builder: (
                  context,
                  index,
                  data,
                ) =>
                    listaDeItens[index],
                count: listaDeItens.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 36, top: 8),
              child: Icon(
                Icons.swipe,
                size: ViewPortUtil(context).propriedades.tamanhoIconeSwipe,
                color: Constants.primaria.shade100,
              ),
            ),
          ],
        );
      });
}
