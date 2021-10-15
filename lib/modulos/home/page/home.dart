import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetoflutter/components/AppBar/app_bar_componente.dart';
import 'package:projetoflutter/components/drawerNavegacao/controller/drawer_navegacao_controller.dart';
import 'package:projetoflutter/components/drawerNavegacao/page/drawer_navegacao_page.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/listaItens/controller/card_controller.dart';
import 'package:projetoflutter/modulos/listaItens/page/card_page.dart';
import 'package:projetoflutter/utils/routers/transition_route_observer.dart';

class HomePage extends StatefulWidget {
  static const String routerName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  static final List<Widget> _widgetOptions = <Widget>[
    CardPage(
      cardController: locator<CardController>(),
    ),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final routeObserver = TransitionRouteObserver<PageRoute>();
  late AnimationController _loadingController;
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);

  @override
  void initState() {
    super.initState();
    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController.forward();

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return SafeArea(child: Observer(
      builder: (context) {
        return Scaffold(
            key: _key,
            appBar: AppBarComponente().buildAppBar(
                _key, tema, context, _loadingController, headerAniInterval),
            body: Center(
              child: _widgetOptions.elementAt(
                  locator<DrawerNavegacaoController>().selectedindexHome),
            ),
            drawer: DrawerNavegacaoPage());
      },
    ));
  }
}
