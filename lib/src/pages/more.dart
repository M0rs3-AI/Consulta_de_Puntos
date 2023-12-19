import 'package:consulta_de_puntos/main.dart';
import 'package:consulta_de_puntos/src/models/state.dart';
import 'package:consulta_de_puntos/src/pages/home.dart';
import 'package:consulta_de_puntos/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about.dart';
import 'contact.dart';
import 'login.dart';
import 'profile.dart';

class MorePage extends StatelessWidget {
  MorePage({Key? key, required this.isLoggedIn}) : super(key: key);
  
  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController currentPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmNewPasswordController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text('Cambiar Contraseña'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: currentPasswordController,
                decoration: const InputDecoration(labelText: 'Contraseña Actual',),
                obscureText: true,
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
              TextFormField(
                controller: newPasswordController,
                decoration: const InputDecoration(labelText: 'Contraseña Nueva',),
                obscureText: true,
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
              TextFormField(
                controller: confirmNewPasswordController,
                decoration: const InputDecoration(labelText: 'Confirmar Contraseña',),
                obscureText: true,
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
              onPressed: () async {
                String currentPassword= currentPasswordController.text;
                String newPassword = newPasswordController.text;
                String confirmNewPassword = confirmNewPasswordController.text;
              if (newPassword == confirmNewPassword) {
                final authState = Provider.of<States>(context, listen: false);
                final success = await ApiService().changePassword(authState.user!.cedula, currentPassword, confirmNewPassword);
                if (success) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contraseña actualizada con éxito')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error al actualizar la contraseña')),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Las contraseñas no coinciden')),);
              }
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
            final authState = Provider.of<States>(context, listen: false);
                  authState.logout();
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