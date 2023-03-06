import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase/autentificacion_firebase.dart';

class Home extends StatefulWidget {
  String email = "";
  Home({Key? key, required this.email}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String nombreCompleto = "";
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    /* print(db.collection('users'));
    db
        .collection("cities")
        .where("capital", isEqualTo: 'lariosascostaa@gmail.com')
        .get()
        .then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        ); */

    final docRef = db.collection("users").doc(widget.email).get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
        print("${data['firstName']}, ${data['lastName']} ");
        setState(() {
          nombreCompleto = "${data['firstName']} ${data['lastName']} ";
        });
        /* nombreCompleto = "${data['firstName']}, ${data['lastName']} "; */
      },
      onError: (e) => print("Error getting document: $e"),
    );

    /* db.collection("users").where("email", isEqualTo: email).get().then(
      (QuerySnapshot doc) {
        final data = 

        print("Successfully completed");
      },
      onError: (e) => print("Error completing: $e"),
    ); */

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home"),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  "Hola !!!:",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Correo: ",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.email,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Nombre: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20)),
                    SizedBox(
                      width: 20,
                    ),
                    Text(nombreCompleto, style: TextStyle(fontSize: 20))
                  ],
                )),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // un ListView puede tener multiples widgets
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Icon(
                  Icons.supervised_user_circle_sharp,
                  size: 100,
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        child: Text("Cerrar Sesion"),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      AutentificacionFirebase())));
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* class Home extends StatelessWidget {
  final String email;

  const Home(this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    /* print(db.collection('users'));
    db
        .collection("cities")
        .where("capital", isEqualTo: 'lariosascostaa@gmail.com')
        .get()
        .then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        ); */

    final docRef = db.collection("users").doc(email).get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
        print("${data['firstName']}, ${data['lastName']} ");
        nombreCompleto = "${data['firstName']}, ${data['lastName']} ";
      },
      onError: (e) => print("Error getting document: $e"),
    );

    /* db.collection("users").where("email", isEqualTo: email).get().then(
      (QuerySnapshot doc) {
        final data = 

        print("Successfully completed");
      },
      onError: (e) => print("Error completing: $e"),
    ); */

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home"),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Bienvenido:",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(email),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(nombreCompleto),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // un ListView puede tener multiples widgets
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Icon(
                  Icons.supervised_user_circle_sharp,
                  size: 100,
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        child: Text("Cerrar Sesion"),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      AutentificacionFirebase())));
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
 */