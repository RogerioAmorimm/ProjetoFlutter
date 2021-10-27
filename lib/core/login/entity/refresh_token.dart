class RefreshTokenModel {
  late String token;
  late String email;

  RefreshTokenModel({
    required this.token,
    required this.email,
  });

  RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    token = json['hash'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = email;
    return data;
  }
}
