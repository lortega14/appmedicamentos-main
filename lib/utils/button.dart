import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/medicaments_register/medicaments_register.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
class Button extends StatelessWidget {
  final int color;
  final double ancho, alto;
  final String contenido;
  const Button({required this.color, required this.ancho, required this.alto, required this.contenido, super.key});

  @override
  Widget build(BuildContext context) {
    //int direction = 1;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),
        ),
        //263, 71
        fixedSize: Size(ancho, alto),
      ),
      onPressed: (){
        //Navigator.of(context).pop();
        Navigator.pushAndRemoveUntil <dynamic>(
          context,
          MaterialPageRoute <dynamic>(
              builder: (BuildContext context) =>NameRegister()
          ),
              (route) => false,
        );
      },
      child: Text(contenido,
        style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Roboto', ),
      ),
    );
  }

}
