import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_de_puntos/src/pages/home.dart';
import 'package:consulta_de_puntos/src/utils/constants.dart';
import 'package:consulta_de_puntos/src/models/auth_state.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: Config.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen()  
    );
  } 
}