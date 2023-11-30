import 'package:app_medicamentos/pages/start_page.dart';
import 'package:app_medicamentos/utils/msgcall.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/medicaments_register/medicaments_register.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:app_medicamentos/pages/appointment_register/appointments.dart';
import 'package:app_medicamentos/pages/home_page.dart';

class Button extends StatelessWidget {
  final int color;
  final double ancho, alto;
  final String contenido;
  final int ruta;
  const Button({required this.color, required this.ancho, required this.alto, required this.contenido, required this.ruta, super.key});

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
        if(ruta == 0){
          Navigator.pushAndRemoveUntil <dynamic>(
            context,
            MaterialPageRoute <dynamic>(
              builder: (BuildContext context) =>MedicamentNameRegister(),
            ),
                (route) => false,
          );
        }
        else if (ruta == 1){
          Navigator.pushAndRemoveUntil <dynamic>(
            context,
            MaterialPageRoute <dynamic>(
              builder: (BuildContext context) =>AppointmentsPage(),
            ),
                (route) => false,
          );
        }
        else if (ruta == 2){
          Navigator.pushAndRemoveUntil <dynamic>(
            context,
            MaterialPageRoute <dynamic>(
                builder: (BuildContext context) => HomePage()
            ),
                (route) => false,
          );
        }

      },
      child: Text(contenido,
        style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Roboto', ),
      ),
    );
  }

}