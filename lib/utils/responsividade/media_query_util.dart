import 'package:flutter/widgets.dart';

mixin MediaQueryUtil {
  static double larguraTotal(context) => MediaQuery.of(context).size.width;
  static double larguraTotalSegura(context) => larguraTotal(context) - 20;

  static double alturaTotal(context) => MediaQuery.of(context).size.height;
  static double alturaTotalSegura(context) => alturaTotal(context) - 120;

  static Size getSize(BoxConstraints constraints, double porcentagem) => Size(
      constraints.maxWidth * (porcentagem / 100),
      constraints.maxHeight * (porcentagem / 100));
}
