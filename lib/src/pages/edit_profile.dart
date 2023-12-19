import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_de_puntos/src/models/state.dart';
import 'package:consulta_de_puntos/src/models/user.dart';
import 'package:consulta_de_puntos/src/services/api_service.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<States>(context);
    final user = authState.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.contains(' ')) {
                    return 'No puede contener espacios';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(labelText: 'Dirección'),
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                validator: (value) {
                  if (value!.contains(' ')) {
                    return 'No puede contener espacios';
                  }
                  return null;
                },
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 36)),
                onPressed: () async {
                  String newEmail = _emailController.text.isEmpty ? user!.email : _emailController.text;
                  String newDireccion = _direccionController.text.isEmpty ? user!.direccion : _direccionController.text;
                  String newTelefono = _telefonoController.text.isEmpty ? user!.telefono : _telefonoController.text;
                  
                  bool updateSuccess = await ApiService().updateProfile(user!.cedula, newEmail, newDireccion, newTelefono);
                  if (updateSuccess) {
                    User? updatedUser = await ApiService().getUserData(user.cedula);
                    if (updatedUser != null) {
                      final authState = Provider.of<States>(context, listen: false);
                      authState.setUser(updatedUser);
                    }
                    Navigator.pop(context);
                  } else {
                  
                  }
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
