// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_firebase/autentificacion_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class ConexionFirebase extends StatefulWidget {
  const ConexionFirebase({Key? key}) : super(key: key);

  @override
  _ConexionFirebaseState createState() => _ConexionFirebaseState();
}

class _ConexionFirebaseState extends State<ConexionFirebase> {
  // Inicializar firebase auth

  Future<FirebaseApp> _initializerFirebase() async {
    //linea de codigo para realizar la conexion a firebase
    // Future => eventos que van a suceder en el futuro
    FirebaseApp firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
     


    return firebaseApp;
  }
  // firebaseApp = await Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializerFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AutentificacionFirebase();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
