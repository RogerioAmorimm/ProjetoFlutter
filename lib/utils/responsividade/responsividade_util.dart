import 'package:flutter/widgets.dart';
import 'package:projetoflutter/utils/responsividade/view_port_util.dart';

mixin ResponsividadeUtil {
  static double getTamanhoFonte(context) {
    return ViewPortUtil(context).propriedades.tamanhoFonte;
  }

  static double getTamanhoIcone(context) {
    return ViewPortUtil(context).propriedades.tamanhoIcone;
  }

  static double getTamanhoIconeItem(context) {
    return ViewPortUtil(context).propriedades.tamanhoIconeItem;
  }

  static Size getTamanhoImagem(context) {
    if (ViewPortUtil(context).inicio == ViewPortUtil.minimo.inicio) {
      return const Size(90, 90);
    }
    return const Size(100, 100);
  }

  static double getValorPaddingTela(context) {
    return ViewPortUtil(context).propriedades.paddingTela;
  }

  static EdgeInsets getPaddingTela(context) {
    final defaultPadding = ViewPortUtil(context).propriedades.paddingTela;
    return EdgeInsets.all(
      defaultPadding,
    );
  }

  static double getValorEspacamentoEntreComponentes(context) {
    return ViewPortUtil(context).propriedades.espacamentoVerticalComponente;
  }

  static SizedBox getEspacamentoEntreComponentes(context) {
    final espacamentoVerticalComponente =
        ViewPortUtil(context).propriedades.espacamentoVerticalComponente;
    return SizedBox(
      height: espacamentoVerticalComponente,
    );
  }
}
