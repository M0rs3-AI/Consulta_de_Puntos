//  Servicio que manejaría las llamadas a tu API para obtener promociones, etc.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:consulta_de_puntos/src/models/users.dart';
import 'package:consulta_de_puntos/src/models/promotions.dart';
import 'package:consulta_de_puntos/src/utils/constants.dart';

class ApiService {
  final baseUrl = Config.apiURL;

  Future<User> getUserProfile(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  // Obtiene la lista de promociones actuales
  Future<List<Promotion>> getPromotions() async {
    final response = await http.get(Uri.parse('$baseUrl/promotions'));

    if (response.statusCode == 200) {
      List<dynamic> promotionsJson = json.decode(response.body);
      return promotionsJson.map((json) => Promotion.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load promotions');
    }
  }
  Future<List<User>> obtenerClientes() async {
    final response = await http.get(Uri.parse('$baseUrl/clientes'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((cliente) => User.fromJson(cliente)).toList();
    } else {
      throw Exception('Failed to load clients');
    }
  }
  // Otros métodos para autenticación, puntos, etc.
}