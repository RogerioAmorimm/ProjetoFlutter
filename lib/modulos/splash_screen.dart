import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetoflutter/components/indicador_processamento.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/home/page/home.dart';
import 'package:projetoflutter/utils/constants.dart';
import 'package:projetoflutter/utils/http/enum_status_request.dart';

import 'home/controller/home_controller.dart';

class SplashScreen extends StatefulWidget {
  static const routerName = '/home-splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = locator<HomeController>();
    controller.carregarDadosHome();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Constants.primaria),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Text("TESTE APENAS"),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Carregando....',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                if (controller.erroProcessamento != null) {
                  return erroProcessamentoRetentativaTelaSplash(
                      controller.erroProcessamento ?? '',
                      () => {controller.carregarDadosHome()},
                      context);
                }

                switch (controller.status) {
                  case StatusRequest.inicial:
                    return processandoLogin();
                  case StatusRequest.processando:
                    return processandoLogin();
                  case StatusRequest.finalizado:
                    Timer(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
                    });

                    return processandoLogin();
                }
              }),
            ],
          )
        ],
      ),
    );
  }
}
