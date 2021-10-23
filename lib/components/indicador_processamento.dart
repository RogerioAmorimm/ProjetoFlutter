import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:projetoflutter/core/exception/validacao_server.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/responsividade/responsividade_util.dart';
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

Center processando() {
  return Center(
    child: Container(
      child: Lottie.asset('assets/json/carregando.json'),
    ),
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

ListView erroProcessamentoRetentativa(
    String mensagem, VoidCallback? retentativa, BuildContext context) {
  final bool ehErroConexao = mensagem == ValidacaoServer.erroConexao().mensagem;
  return ListView(children: [
    Container(
      child: Lottie.asset(ehErroConexao
          ? 'assets/json/disconnect.json'
          : 'assets/json/error.json'),
    ),
    ResponsividadeUtil.getEspacamentoEntreComponentes(context),
    Center(
      child: Text(
        ehErroConexao ? 'Erro de conexão' : 'Erro de Processamento',
        style: const TextStyle(
            color: Constants.primaria,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    ),
    ResponsividadeUtil.getEspacamentoEntreComponentes(context),
    Center(
      child: Text(mensagem),
    ),
    const Center(
      child: Text('Clique no botão abaixo e tente novamente'),
    ),
    Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: retentativa,
        child: const Text('Tentar Novamente'),
      ),
    )
  ]);
}

void mostrarFlushbarSucesso(BuildContext context, String mensagem) {
  WidgetsBinding.instance!.addPostFrameCallback((_) => {
        Flushbar(
          title: 'Sucesso!',
          message: mensagem,
          icon: Icon(
            Icons.check_circle,
            size: ValorPadrao().tamanhoIcone,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 5),
        )..show(context)
      });
}
