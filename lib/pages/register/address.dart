import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/register/birth_date_register.dart';
import 'package:app_medicamentos/pages/register/pathologies.dart';

import '../../models/user_model.dart';

class Address extends StatefulWidget {
  const Address({super.key, required User this.user});

  final User user;


  @override
  State<StatefulWidget> createState() {
    return _Address();
  }
}

class _Address extends State <Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEDF2FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text(
            'Registro de Paciente',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF09184D)),
            onPressed: () {
              Navigator.pushAndRemoveUntil <dynamic>(
                context,
                MaterialPageRoute <dynamic>(
                    builder: (BuildContext context) => BirthDateRegister(user: widget.user)
                ),
                    (route) => false,
              );
            },
          ),
          actions: const [],
          backgroundColor: const Color(0xFFEDF2FA),
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Row(
              children: [
                 Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Domicilio',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '(opcional)',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF6A6A6A),
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Calle',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),

            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  const BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TextFormField(
                controller: calleController,
                obscureText: false,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid

                      )
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (text) {
                  setState(() {
                    // Verificar si el texto no está vacío
                    if (text.trim().isNotEmpty) {
                      // Convertir la primera letra a mayúscula
                      text = text[0].toUpperCase() + text.substring(1);
                      // Asignar el texto al controlador
                      calleController.text = text;

                    }
                  });
                },
              ),
            ),
            const SizedBox(height: 20.0,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Colonia',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  const BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TextFormField(
                controller: coloniaController,
                obscureText: false,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid

                      )
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (text) {
                  setState(() {
                    // Verificar si el texto no está vacío
                    if (text.trim().isNotEmpty) {
                      // Convertir la primera letra a mayúscula
                      text = text[0].toUpperCase() + text.substring(1);
                      // Asignar el texto al controlador
                      coloniaController.text = text;
                    }
                  });
                },
              ),
            ),
            const SizedBox(height: 20.0,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Numero Exterior',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TextFormField(
                controller: numExteriorController,
                obscureText: false,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid

                      )
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (text) {
                  setState(() {
                    // Verificar si el texto no está vacío
                    if (text.trim().isNotEmpty) {
                      // Convertir la primera letra a mayúscula
                      text = text[0].toUpperCase() + text.substring(1);
                      // Asignar el texto al controlador
                      numExteriorController.text = text;
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Container(
                width: 193,
                height: 77,
                child: ElevatedButton(
                  onPressed: () {
                    SetUser();
                    Navigator.pushAndRemoveUntil <dynamic>(
                      context,
                      MaterialPageRoute <dynamic>(
                          builder: (BuildContext context) => Pathologies(user: widget.user,)
                      ),
                          (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0063C9),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )
                  ),
                  child: const Text("Siguiente",
                    style: TextStyle(
                        fontSize: 26
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void SetUser(){
    widget.user.calle = calleController.text;
    widget.user.club = coloniaController.text;
    widget.user.numExterior = numExteriorController.text;
  }
}

TextEditingController calleController = TextEditingController();
TextEditingController coloniaController = TextEditingController();
TextEditingController numExteriorController = TextEditingController();