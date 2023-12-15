import 'package:flutter/material.dart';
import 'edit_profile.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulando datos de usuario obtenidos de una API
    const String userName = "Ariel";
    const String points = "1,500"; // Este valor eventualmente vendrá de una API

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
                      const Text('Hola, $userName',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(points, 
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('C.I.'),
                  subtitle: Text('11111111'),
                ),
                const ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text('email@email.com'),
                ),
                const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Dirección'),
                  subtitle: Text('Cualquier Lugar'),
                ),
                const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Teléfono'),
                  subtitle: Text('11111111'),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}