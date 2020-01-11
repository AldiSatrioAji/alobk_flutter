import 'package:alobk_app/src/data/model/login_request.dart';

abstract class LoginRepository {
  Future<bool> authenticate(String username, String password);
  Future<bool> hasSession();
  Future<bool> clearSession();
}