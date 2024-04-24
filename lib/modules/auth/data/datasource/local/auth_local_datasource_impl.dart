import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  AuthLocalDataSourceImpl({required this.secureStorage});

  final KeyValueStorageService secureStorage;

  @override
  Future<void> saveToken({required String value}) async {
    secureStorage.setAuthToken(value);
  }

  @override
  Future<void> removeToken() async {
    secureStorage.resetKeys();
  }
}
