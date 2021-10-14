import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projetoflutter/utils/responsividade/valor_padrao.dart';

SpinKitWave processandoLogin() {
  return SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.white : Colors.amber,
        ),
      );
    },
  );
}

Center erroProcessamentoRetentativaTelaSplash(
    String mensagem, VoidCallback? retentativa, BuildContext context) {
  mostrarFlushbarErro(context, mensagem);

  return Center(
      child: Padding(
    padding: const EdgeInsets.all(20),
    child: ElevatedButton(
      onPressed: retentativa,
      child: const Text('Tentar Novamente'),
    ),
  ));
}

void mostrarFlushbarErro(BuildContext context, String mensagem) {
  WidgetsBinding.instance!.addPostFrameCallback((_) => {
        Flushbar(
          title: 'Ops, algo deu errado!',
          message: mensagem,
          icon: Icon(
            Icons.info_outline,
            size: ValorPadrao().tamanhoIcone,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        )..show(context)
      });
}
