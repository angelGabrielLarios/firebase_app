import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase/home.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({Key? key}) : super(key: key);

  @override
  _RegistrarUsuarioState createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  TextEditingController _firstName = TextEditingController(text: "");
  TextEditingController _lastName = TextEditingController(text: "");
  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _password = TextEditingController(text: "");

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String _mensajeError = "";

  Future<User?> createUser(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          _mensajeError = "The password provided is too weak.";
        });
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _mensajeError = "The account already exists for that email.";
        });
      }
    } catch (e) {
      setState(() {
        _mensajeError = e.toString();
      });
    }
    return user;
  }

  void addUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required BuildContext context}) {
    // Call the user's CollectionReference to add a new user
    /* CollectionReference users = FirebaseFirestore.instance.collection('users'); */

    users.doc(email).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password
    });

    print('Ya estufas');

    /* return users
        .add({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error")); */
  }

  @override
  Widget build(BuildContext context) {
    /* void registrarUsuario() async {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );

        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => Home(_email.text))));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          setState(() {
            _mensajeError = "The password provided is too weak.";
          });
        } else if (e.code == 'email-already-in-use') {
          setState(() {
            _mensajeError = "The account already exists for that email.";
          });
        }
      } catch (e) {
        setState(() {
          _mensajeError = e.toString();
        });
      }
    } */

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  "Registrar Usuario",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Center(
                child: Icon(
              Icons.supervised_user_circle_sharp,
              size: 200,
            )),
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
              controller: _firstName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "First Name"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _lastName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Last Name"),
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
                      User? user = await createUser(
                          email: _email.text,
                          pass: _password.text,
                          context: context);

                      addUser(
                          firstName: _firstName.text,
                          lastName: _lastName.text,
                          password: _password.text,
                          email: _email.text,
                          context: context);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => Home(
                                email: _email.text,
                              ))));
                    },
                    child: Text('save'))
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Regresar Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
