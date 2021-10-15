import 'package:flutter/widgets.dart';
import 'package:projetoflutter/utils/constants.dart';

class ItemPage extends StatelessWidget {
  const ItemPage(this.icone, this.conteudo,
      {key,
      this.tamanhoIcone = 32,
      this.tamanhoFonte = 18,
      this.padding = const EdgeInsets.only(left: 16, top: 8)})
      : super(key: key);
  final IconData icone;
  final String conteudo;
  final double tamanhoIcone;
  final double tamanhoFonte;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icone,
              color: Constants.primaria,
              size: tamanhoIcone,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  conteudo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: tamanhoFonte),
                ),
              ),
            ),
          ],
        ),
      );
}
