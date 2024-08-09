

import 'package:store/Features/auth/data/models/auth.dart';
import 'package:store/Features/auth/data/web_services/auth_web_services.dart';

class AuthRepository {
  final AuthWebServices authWebServices;

  AuthRepository(this.authWebServices);

  Future<AuthResponse?> login(String username, String password) async {
    final response = await authWebServices.login(username, password);
    if (response.isNotEmpty) {
      return AuthResponse.fromJson(response);
    }
    return null;
  }
}
