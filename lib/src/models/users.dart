// Clase que define la estructura de datos del usuario
class User {  
  final String cedula;
  final String name;
  final String email;
  final String direccion;
  final String telefono;
  final String puntos;
  final String contrasena;
  
  User({required this.cedula, required this.name, required this.email, required this.direccion, required this.telefono, required this.puntos, required this.contrasena});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      cedula: json['cedula'],
      name: json['name'],
      email: json['email'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      puntos: json['puntos'],
      contrasena: json['contrasena'],
    );
  }
}
