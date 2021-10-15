import 'package:projetoflutter/utils/responsividade/valor_padrao.dart';

import 'media_query_util.dart';

class ViewPortUtil {
  factory ViewPortUtil(context) {
    final largura = MediaQueryUtil.larguraTotal(context);
    final altura = MediaQueryUtil.alturaTotal(context);

    final valorAConsiderar = largura < altura ? largura : altura;
    return viewPorts.firstWhere((element) =>
        element.inicio <= valorAConsiderar && element.fim >= valorAConsiderar);
  }

  final double inicio;
  final double fim;
  final ValorPadrao propriedades;

  ViewPortUtil._internal(this.inicio, this.fim, this.propriedades);

  static final minimo = ViewPortUtil._internal(
    double.minPositive,
    480,
    ValorPadrao(
      tamanhoFonte: 16,
      tamanhoIcone: 20,
      paddingTela: 8,
      tamanhoIconeItem: 18,
    ),
  );

  static final medio = ViewPortUtil._internal(
    481,
    768,
    ValorPadrao(
      tamanhoFonte: 18,
    ),
  );

  static final grande = ViewPortUtil._internal(
    769,
    double.maxFinite,
    ValorPadrao(tamanhoFonte: 22, paddingTela: 24, tamanhoIconeSwipe: 48),
  );

  static final viewPorts = [minimo, medio, grande];
}
