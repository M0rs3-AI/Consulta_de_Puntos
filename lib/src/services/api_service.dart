// Servicio para manejar la autenticación y registro de usuarios.
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:consulta_de_puntos/src/models/user.dart';
import 'package:consulta_de_puntos/src/utils/constants.dart';

class ApiService {
  final String baseUrl = Config.apiURL;
  final String loginUrl = Config.loginAPI;
  final String updateUrl = Config.userUpdateAPI;
  final String changePasswordUrl = Config.userChangePasswordAPI;
  final String recoverPasswordUrl = Config.recoverPasswordAPI;

  Future<User?> login(String cedula, String password) async {
    try {
      final response = await http.post(
        Uri.http(baseUrl, loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'cedula': cedula,
          'password': password
        }),
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success']) {
          return User.fromJson(jsonResponse['data']);
        } else {
        }
      } else {
        return null;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<User?> getUserData(String cedula) async {
    try{
      final cedulaLimpia = cedula.trim();

      final response = await http.get(
        Uri.http(baseUrl, '/users/$cedulaLimpia'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return User.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateProfile(String cedula, String newEmail, String newDireccion, String newTelefono) async {
    try{
      final response = await http.post(
        Uri.http(baseUrl, updateUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'cedula': cedula,
          'new_email': newEmail,
          'new_direccion': newDireccion,
          'new_telefono': newTelefono,
        }),
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

  Future<bool> changePassword(String cedula, String currentPassword, String newPassword) async {
    try {
      final response = await http.post(
        Uri.http(baseUrl, changePasswordUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'cedula': cedula,
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        }),
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


  Future<bool> recoverPassword(String email) async {
    try {
      final response = await http.post(
        Uri.http(baseUrl, recoverPasswordUrl),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'email': email}),
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
