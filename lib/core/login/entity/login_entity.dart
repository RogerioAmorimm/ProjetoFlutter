class LoginEntity {
  late String nome;
  late String senha;
  LoginEntity({
    required this.nome,
    required this.senha,
  });

  LoginEntity.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'senha': senha,
    };
  }
}
