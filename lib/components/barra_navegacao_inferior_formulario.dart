import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';  
import 'package:projetoflutter/utils/constants.dart';

class BarraNavegaoInferiorFormulario extends StatelessWidget {
  const BarraNavegaoInferiorFormulario(
      {required this.formKey,
      required this.retornoVoltar,
      required this.retornoSalvar,
      Key? key})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final VoidCallback retornoVoltar;
  final VoidCallback retornoSalvar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: retornoVoltar,
              color: Constants.primaria,
              textColor: Colors.white,
              child: const Text('Voltar'),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  retornoSalvar();
                }
              },
              color: Constants.primaria,
              textColor: Colors.white,
              child: const Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}
