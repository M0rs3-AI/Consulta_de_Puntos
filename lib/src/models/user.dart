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
      cedula: json['Cedula'],
      name: json['Nombre'],
      email: json['Correo'],
      direccion: json['Direccion'],
      telefono: json['Telefono1'],
      puntos: json['Puntos'] ?? '0',
      contrasena: json['Password'],
    );
  }
}

