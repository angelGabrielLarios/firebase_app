import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/registrar_usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_firebase/home.dart';
import 'package:flutter_app_firebase/email_invalid.dart';
import 'package:flutter_app_firebase/password_invalid.dart';

class AutentificacionFirebase extends StatefulWidget {
  const AutentificacionFirebase({Key? key}) : super(key: key);

  @override
  _AutentificacionFirebaseState createState() =>
      _AutentificacionFirebaseState();
}

class _AutentificacionFirebaseState extends State<AutentificacionFirebase> {
  String _mensajeError = "";

  @override
  Future<User?> loginUser(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        _mensajeError = "No user found for that email.";
        setState(() {
          _mensajeError = "No user found for that email.";
        });
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        setState(() {
          _mensajeError = "Wrong password provided for that user";
        });
      }
    }
    return user;
  }

  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController(text: "");
    TextEditingController _password = TextEditingController(text: "");

    void autentificarUsuario() async {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email.text, password: _password.text);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => Home(
                      email: _email.text,
                    ))));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          _mensajeError = "No user found for that email.";
          setState(() {
            _mensajeError = "No user found for that email.";
          });
        } else if (e.code == 'wrong-password') {
          //print('Wrong password provided for that user.');
          setState(() {
            _mensajeError = "Wrong password provided for that user";
          });
        }
        // 13214qeqwe
      }
    }

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Center(
            child: Icon(
              Icons.supervised_user_circle_sharp,
              size: 200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              _mensajeError,
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(250, 232, 12, 12),
                  fontWeight: FontWeight.w900),
            ),
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
            obscureText: true,
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
                onPressed: () async {
                  User? user = await loginUser(
                      email: _email.text,
                      pass: _password.text,
                      context: context);

                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => Home(
                              email: _email.text,
                            ))));
                  }
                },
                child: Text('Login'),
              ),
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
