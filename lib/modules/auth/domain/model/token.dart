import 'package:s_mobills/modules/auth/module.dart';

class Token {
  const Token({required this.token});

  factory Token.fromData({required LoginResponse response}) {
    return Token(token: response.token);
  }

  final String token;
}
