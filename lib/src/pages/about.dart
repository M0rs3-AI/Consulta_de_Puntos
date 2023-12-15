import 'package:flutter/material.dart';
import 'package:consulta_de_puntos/src/widgets/padded_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca De'),
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
            const CustomTextSection(
              text: 'Version 1.0',
            ),
            const CustomTextSection(
              text: 'Todos los derechos reservados',
            ),
          ],
        ),
      ),
    );
  }
}