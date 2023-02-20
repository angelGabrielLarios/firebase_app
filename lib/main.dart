import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_firebase/autentificacion_firebase.dart';
import 'package:flutter_app_firebase/conexion_firebase.dart';
/*
main.dart
conexion_firebase.dart
autentificacion_firebase.dart
registrar_usuario
*/

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ConexionFirebase(),
    );
  }
}
