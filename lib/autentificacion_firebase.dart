import 'package:flutter/material.dart';

void main() {
  runApp(AutentificacionFirebase());
}

class AutentificacionFirebase extends StatelessWidget {
  const AutentificacionFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('App Autentificacion'),
        ),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Icon(
            Icons.home,
            size: 50,
          ),
        ],
      ),
    );
  }
}
