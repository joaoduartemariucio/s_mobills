abstract class AuthLocalDataSource {
  Future<void> saveToken({required String value});
  Future<void> removeToken();
}
