import 'package:flutter/material.dart';
import 'package:consulta_de_puntos/src/widgets/padded_text.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacto'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset('assets/images/Colorful.png', fit: BoxFit.cover, width: MediaQuery.of(context).size.width * 0.9,height: 200,),
            ),
            const CustomTextSection(
              text: 'Puntos',
              spacing: 20.0,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                CustomTextSection(
                  text: 'Email de Contacto',
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                CustomTextSection(
                  text: 'Numero de Contacto',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

