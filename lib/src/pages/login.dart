import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_de_puntos/main.dart';
import 'package:consulta_de_puntos/src/models/auth_state.dart';
import 'package:consulta_de_puntos/src/services/auth_service.dart';
import 'package:consulta_de_puntos/src/pages/home.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showRecoverPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text('Recuperar Contraseña'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ingrese su email y le enviaremos su nueva contraseña'),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                // Asegúrate de incluir validación y manejo de errores
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
            TextButton(
              child: const Text('Recuperar'),
              onPressed: () {
                // Lógica para recuperar contraseña
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _cedulaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cédula',
                prefixIcon: Icon(Icons.credit_card),
              ),
              // Asegúrate de incluir validación y manejo de errores
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
              // Asegúrate de incluir validación y manejo de errores
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Ingresar'),
              onPressed: () async {
                // Lógica para iniciar sesión
                String cedula = _cedulaController.text;
                String password = _passwordController.text;
                // Llamar al servicio de autenticación
                bool loggedIn = await AuthService().login(cedula, password);
                if (loggedIn) {
                /// Navegar a la pantalla principal si la autenticación es exitosa
                  final authState = Provider.of<AuthState>(context, listen: false);
                  authState.isLoggedIn = true;
                  navigatorKey.currentState!.pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  // Mostrar mensaje de error
                  // ...
                }
              },
            ),
            TextButton(
              child: const Text('Regístrate aquí'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
            ),
            TextButton(
              child: const Text('Recuperar contraseña'),
              onPressed: () => _showRecoverPasswordDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
