abstract class LoginRepository {
  Future<bool> authenticate(String username, String password);
  Future<bool> hasSession();
  Future<bool> clearSession();
}