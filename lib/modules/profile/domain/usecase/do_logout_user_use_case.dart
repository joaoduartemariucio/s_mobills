import 'package:flutter/material.dart';
import 'package:s_mobills/modules/auth/module.dart';

class DoLogoutUserUseCase {
  const DoLogoutUserUseCase({required this.repository});

  final AuthRepository repository;

  Future<void> call() async {
    try {
      await repository.logout();
    } catch (e) {
      debugPrint("LOGOUT API ERROR +++++++++++");
    }
    await repository.removeToken();
  }
}
