import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/registrar_usuario.dart';

class AutentificacionFirebase extends StatelessWidget {
  const AutentificacionFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController(text: "");
    TextEditingController _password = TextEditingController(text: "");

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Center(
            child: Icon(
              Icons.supervised_user_circle_sharp,
              size: 200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _email,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Example@email.com"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _password,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "password"),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
                style: ButtonStyle(
                  padding: EdgeInsetsGeometry(
                    
                  )
                ),
              )
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrarUsuario()),
                    );
                  },
                  child: Text('Registrer'))
            ],
          )
        ],
      ),
    ));
  }
}
