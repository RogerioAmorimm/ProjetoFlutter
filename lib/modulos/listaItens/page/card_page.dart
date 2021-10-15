import 'package:flutter/material.dart';
import 'package:projetoflutter/components/snap_list.dart';
import 'package:projetoflutter/modulos/listaItens/controller/card_controller.dart';
import 'package:projetoflutter/utils/routers/transition_route_observer.dart';

class CardPage extends StatefulWidget {
  final CardController cardController;
  const CardPage({required this.cardController, key}) : super(key: key);
  static const routerName = '/card';
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  @override
  Widget build(BuildContext context) {
    final controller = widget.cardController;
    final theme = Theme.of(context);

    return LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      return SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        color: theme.primaryColor.withOpacity(.1),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: SnapListCuston(
                    listaDeItens: controller.listaDeCards(),
                    loadMore: controller.obterProximosCards,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
    });
  }
}
