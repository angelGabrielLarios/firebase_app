import 'package:flutter/material.dart';

class PasswordInvalid extends StatelessWidget {
  const PasswordInvalid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password no es incorrecta'),
      ),
      body: Container(),
    );
  }
}
