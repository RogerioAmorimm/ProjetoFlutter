import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetoflutter/ioc/service_locator.dart';
import 'package:projetoflutter/modulos/mensagens/controller/mensagem_controller.dart';
import 'package:projetoflutter/utils/constants.dart';

class ControleFiltroMensagemComponente extends StatelessWidget {
  const ControleFiltroMensagemComponente({required this.controller, key})
      : super(key: key);
  final MensagemController controller;
  @override
  Widget build(BuildContext context) {
    const bordaCampoPesquisa = BorderRadius.all(Radius.circular(4));

    final _controller = TextEditingController();

    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Material(
                  child: TextField(
                    controller: _controller,
                    onChanged: (texto) {
                      controller.filtroDeTexto = texto;
                    },
                    onEditingComplete: () {
                      locator<MensagemController>().atualizar();
                    },
                    textInputAction: TextInputAction.search,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Constants.primaria,
                        size: 20,
                      ),
                      hintText: 'pesquisar...',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: bordaCampoPesquisa,
                        borderSide: BorderSide(
                          color: Constants.primaria.shade100,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: bordaCampoPesquisa,
                        borderSide: BorderSide(color: Constants.accent),
                      ),
                      isDense: true,
                      suffix: controller.filtroDeTexto.isNotEmpty
                          ? IconButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              constraints: const BoxConstraints(
                                  maxHeight: 48, maxWidth: 48),
                              splashRadius: 20,
                              iconSize: 18,
                              onPressed: () {
                                controller.filtroDeTexto = '';
                                _controller.clear();
                              },
                              icon: Icon(
                                Icons.clear,
                                color: Constants.primaria.shade900,
                              ),
                            )
                          : const Text(''),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
