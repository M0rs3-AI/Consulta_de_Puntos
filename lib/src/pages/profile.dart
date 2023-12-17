import 'package:consulta_de_puntos/src/models/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  
  // @override
  //   State<ProfilePage> createState() => _ProfilePageState();
  // }

  // class _ProfilePageState extends State<ProfilePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final authState = Provider.of<States>(context, listen: false);
  //     authState.refreshUserData();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<States>(context);
    final user = authState.user;

    final cedula = user?.cedula;
    final nombre = user?.name;
    final email = user?.email;
    final direccion = user?.direccion;
    final telefono = user?.telefono;
    final puntos = user?.puntos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: Column(
                    children: [
                      Text('Hola, ${nombre ?? 'No disponible'}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(puntos ?? 'No disponible', 
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.credit_card),
                  title: const Text('C.I.'),
                  subtitle: Text(cedula ?? 'No disponible'),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                  subtitle: Text(email ?? 'No disponible'),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Dirección'),
                  subtitle: Text(direccion ?? 'No disponible'),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Teléfono'),
                  subtitle: Text(telefono ?? 'No disponible'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Editar'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () async {
                // await authState.refreshUserData();
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
                  // await authState.refreshUserData();
              },
            ),
          ),
        ],
      ),
    );
  }
}