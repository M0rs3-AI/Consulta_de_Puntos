import 'package:consulta_de_puntos/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_de_puntos/main.dart';
import 'package:consulta_de_puntos/src/models/state.dart';
import 'package:consulta_de_puntos/src/services/api_service.dart';
import 'package:consulta_de_puntos/src/pages/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showRecoverPasswordDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text('Recuperar Contraseña'), 
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Ingrese su email y le enviaremos su nueva contraseña'),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Recuperar'),
              onPressed: () async {
                final email = emailController.text;
                final success = await ApiService().recoverPassword(email);
                if (success) {
                } else {
                }
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
            TextFormField(
              controller: _cedulaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cédula',
                prefixIcon: Icon(Icons.credit_card),
              ),
              validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese su cedula';
                  }
                  if (value.contains(' ')) {
                    return 'No puede contener espacios';
                  }
                  return null;
                },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
              validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese una contraseña';
                  }
                  if (value.contains(' ')) {
                    return 'La contraseña no puede contener espacios';
                  }
                  return null;
                },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Ingresar'),
              onPressed: () async {
                // Lógica para iniciar sesión
                String cedula = _cedulaController.text;
                String password = _passwordController.text;
                // Llamar al servicio de autenticación
                User? user = await ApiService().login(cedula, password);
                if (user != null) {
                /// Navegar a la pantalla principal si la autenticación es exitosa
                  final authState = Provider.of<States>(context, listen: false);
                  authState.login(user);
                  navigatorKey.currentState!.pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                }
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
