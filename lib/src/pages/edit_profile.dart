import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Dirección',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Teléfono',
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 36),),
              onPressed: () {
                // Lógica para aceptar y guardar los cambios
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      ),
    );
  }
}
