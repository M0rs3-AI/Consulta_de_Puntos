// Servicio para manejar la autenticación y registro de usuarios.
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:consulta_de_puntos/src/utils/constants.dart';

class AuthService {
  final String baseUrl = Config.apiURL;
  final String loginUrl = Config.loginAPI;

  Future<bool> login(String cedula, String password) async {
    try {
      final response = await http.post(
        Uri.http(Config.apiURL,loginUrl),
        // Uri.parse('$baseUrl/$loginUrl'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'cedula': cedula, 'password': password}),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}