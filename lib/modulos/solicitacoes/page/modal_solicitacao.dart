import 'package:flutter/material.dart';
import 'package:projetoflutter/utils/constants.dart';

// ignore: must_be_immutable
class ModalSolicitacao extends StatefulWidget {
  String titulo;
  Map<String, String> dados;
  Widget? botaoAdicional;
  ModalSolicitacao(
      {required this.titulo,
      required this.dados,
      required this.botaoAdicional});

  @override
  _ModalSolicitacaoState createState() => _ModalSolicitacaoState();
}

class _ModalSolicitacaoState extends State<ModalSolicitacao> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> conteudo = [];

    widget.dados.forEach((key, value) {
      conteudo.add(Text(key,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold)));
      conteudo.add(Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(value,
              style: TextStyle(color: Constants.primaria.shade900))));
    });

    final botaoVoltar = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'Voltar',
          textAlign: TextAlign.center,
        ),
      ),
    );

    final List<Widget> elementosBotaoAdicional = [];
    if (widget.botaoAdicional != null) {
      elementosBotaoAdicional.add(const SizedBox(
        width: 16,
      ));
      elementosBotaoAdicional
          .add(Expanded(child: widget.botaoAdicional ?? Container()));
    }

    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Container(
        padding: const EdgeInsets.only(bottom: 12),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Constants.primaria))),
        child: Text(
          widget.titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Constants.primaria,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(children: <Widget>[
          ...conteudo,
        ]),
      ),
      contentPadding: const EdgeInsets.only(top: 12, left: 32, right: 32),
      actions: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [botaoVoltar, ...elementosBotaoAdicional],
          ),
        )
      ],
    );
  }
}
