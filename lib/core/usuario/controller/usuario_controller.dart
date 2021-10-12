import 'package:mobx/mobx.dart';
import 'package:projetoflutter/core/usuario/entity/usuario_entity.dart';
part 'usuario_controller.g.dart';

class UsuarioController = _UsuarioControllerBase with _$UsuarioController;

abstract class _UsuarioControllerBase with Store {
  @observable
  UsuarioEntity? _usuario;
  @action
  UsuarioEntity? getUsuarioLogado() => _usuario;
  @action
  Future setUsuarioLogado(UsuarioEntity? usuario) async {
    _usuario = usuario;
    await usuario?.salvarToken();
  }
}
