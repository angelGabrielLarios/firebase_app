import 'package:flutter/material.dart';

class MensajeError extends StatefulWidget {
  final String textoMensaje;
  const MensajeError(this.textoMensaje, {Key? key}) : super(key: key);

  @override
  _MensajeErrorState createState() => _MensajeErrorState();
}

class _MensajeErrorState extends State<MensajeError> {
  @override
  Widget build(BuildContext context) {
    // textoMensaje
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "hola",
        style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(250, 232, 12, 12),
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
