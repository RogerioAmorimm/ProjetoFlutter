import 'dart:convert';
import 'dart:ui';

import 'package:flutter/widgets.dart';

class ItemFotoComponent extends StatelessWidget {
  final String url;
  final BorderRadius? bordaImagem;
  final double alturaImagem;

  const ItemFotoComponent({
    required this.url,
    required this.alturaImagem,
    this.bordaImagem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final basefoto = base64.decode(url);
    BorderRadius? borda = bordaImagem;
    borda ??= BorderRadius.circular(0);
    const alturaPadraoDaImagem = 320;
    final proporcaoDaImagem = alturaPadraoDaImagem / alturaImagem;

    final fotoItem = ClipRRect(
      borderRadius: borda,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(0),
              height: alturaImagem,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    child: Image.network(
                      url,
                      fit: BoxFit.fill,
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: ClipRRect(
                      child: Image.network(
                        url,
                        scale: proporcaoDaImagem,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return fotoItem;
  }
}
