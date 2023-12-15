import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Introduce tu Nombre',
              ),
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'C.I.',
                hintText: 'Introduce tu Cédula de Identidad',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Introduce tu Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Direccion',
                hintText: 'Introduce tu Direccion',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Telefono',
                hintText: 'Introduce tu numero de Telefono',
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña.',
                hintText: 'Introduce tu Contraseña',
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirma tu Contraseña',
                hintText: 'Introduce tu Contraseña Nuevamente',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para el registro
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
