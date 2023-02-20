import 'package:flutter/material.dart';

class RegistrarUsuario extends StatelessWidget {
  const RegistrarUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstName = TextEditingController(text: "");
    TextEditingController _lastName = TextEditingController(text: "");
    TextEditingController _email = TextEditingController(text: "");
    TextEditingController _password = TextEditingController(text: "");

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.supervised_user_circle_sharp,
              size: 200,
            )),
            SizedBox(
              height: 20,
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
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => Info(_firstName.text,
                          //           _lastName.text, _email.text, _password.text)),
                          // );
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
