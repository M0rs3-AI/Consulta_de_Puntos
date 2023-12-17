import 'package:consulta_de_puntos/src/models/user.dart';
import 'package:consulta_de_puntos/src/services/api_service.dart';
import 'package:flutter/foundation.dart';

class States extends ChangeNotifier {
  User? _user;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  User? get user => _user;

  void login(User user) {
    _isLoggedIn = true;
    _user = user;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _user = null;
    notifyListeners();
  }

    void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> refreshUserData() async {
    if (_user != null) {
      final updatedUser = await ApiService().getUserData(_user!.cedula);
      if (updatedUser != null) {
        setUser(updatedUser);
      }
    }
  }
}