import 'package:consulta_de_puntos/main.dart';
import 'package:consulta_de_puntos/src/models/auth_state.dart';
import 'package:consulta_de_puntos/src/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about.dart';
import 'contact.dart';
import 'login.dart';
import 'profile.dart';

class MorePage extends StatelessWidget {
  MorePage({Key? key, required this.isLoggedIn}) : super(key: key);
  
  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text('Cambiar Contraseña'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña Actual',
                ),
                // Asegúrate de incluir validación y manejo de errores
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña Nueva',
                ),
                // Asegúrate de incluir validación y manejo de errores
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirmar Contraseña',
                ),
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
              child: const Text('Confirmar'),
              onPressed: () {
                // Lógica para cambiar de contraseña
              },
            ),
          ],
        );
      },
    );
  }

  bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = [
      ListTile(
        leading: const Icon(Icons.account_circle),
        title: const Text('Perfil'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => isLoggedIn ? const ProfilePage() : LoginPage(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.contact_mail),
        title: const Text('Contacto'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactPage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.info),
        title: const Text('Acerca De'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutPage()),
          );
        },
      ),
    ];

    if (isLoggedIn == true){
      tiles.insertAll(1, [
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('Cambiar Contraseña'),
          onTap: () => _showChangePasswordDialog(context),
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Cerrar Sesión'),
          onTap: () {
            final authState = Provider.of<AuthState>(context, listen: false);
                  authState.isLoggedIn = false;
                  navigatorKey.currentState!.pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
          },
        ),
      ]);
    }

    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList(),
    );
  }
}