import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  final String contenido;
  const Texto({required this.contenido, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55.0, right: 45.0),
      child: Text(contenido,
        style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 25,
          fontFamily: 'Roboto',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
