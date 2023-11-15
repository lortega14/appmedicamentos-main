//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/start_page.dart';
import 'package:app_medicamentos/pages/register/birth_date_register.dart';
import '../../models/user_model.dart';
import 'package:app_medicamentos/utils/validaciones.dart';

class NameRegister extends StatefulWidget {
  const NameRegister({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NameRegister();
  }
}

class _NameRegister extends State <NameRegister> {

  final User user = User();

  //Declaración de variables para validar las entradas ingresadas por el usuario
  late bool _validateU = false;
  late bool _validateApp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Registro de paciente',
              style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF09184D)),
            onPressed: () {
              Navigator.pushAndRemoveUntil <dynamic>(
                context,
                MaterialPageRoute <dynamic>(
                    builder: (BuildContext context) => StartPage()
                ),
                    (route) => false,
              );
            },
          ),
          actions: const [],
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Nombre(s)',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nombreController,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),

                    filled: true,
                    fillColor: Colors.white,
                    errorText: _validateU ? 'Debe ingresar su nombre(s) \ncorrectamente' : null,

                    errorStyle: TextStyle(fontSize: 18, color: Color(0xFFFF1744)),

                    contentPadding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      left: 15.0,
                      right: 15.0,
                    ),
                  ),
                  style: const TextStyle(height: 1.5),
                  onChanged: (text) {
                    setState(() {
                      if (text.trim().isNotEmpty) {
                        // Dividir el texto por espacios y capitalizar la primera letra de cada palabra
                        List<String> words = text.split(' ');
                        for (int i = 0; i < words.length; i++) {
                          words[i] = words[i][0].toUpperCase() + words[i].substring(1);
                        }
                        // Unir las palabras de nuevo con espacios y asignar al controlador
                        nombreController.text = words.join(' ');
                        _validateU = false;
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Apellido paterno',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: apellidoPController,
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
                    errorText: _validateApp ? 'Debe ingresar su apellido paterno \ncorrectamente' : null,
                    errorStyle: TextStyle(fontSize: 18, color: Color(0xFFFF1744)),
                  ),
                  style: const TextStyle(height: 1.5),
                  onChanged: (text) {
                    setState(() {
                      // Verificar si el texto no está vacío
                      if (text.trim().isNotEmpty) {
                        // Convertir la primera letra a mayúscula
                        text = text[0].toUpperCase() + text.substring(1);
                        // Asignar el texto al controlador
                        apellidoPController.text = text;
                        _validateApp = false;
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Apellido materno',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    /*fontWeight: FontWeight.bold,*/
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
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
                controller: apellidoMController,
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
                style: const TextStyle(height: 1.5),
                onChanged: (text) {
                  setState(() {
                    if (text.isNotEmpty) {
                      // Convertir la primera letra a mayúscula
                      text = text[0].toUpperCase() + text.substring(1);

                      // Actualizar el controlador con el texto modificado
                      apellidoMController.text = text;
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
                    setState(() {
                      //Verificar que el nombre completo cumpla las características de la expresión regular
                      String? nombreError = validateNombre(nombreController.text);
                      _validateU = nombreError != null;

                      //Verificar que el nombre completo cumpla las características de la expresión regular
                      String? appaternoError = validateApellidos(apellidoPController.text);
                      _validateApp = appaternoError != null;

                      if(!_validateU && !_validateApp ){
                        print(nombreController.text);
                        print(apellidoPController.text);
                        print(apellidoMController.text);
                        Navigator.pushAndRemoveUntil <dynamic>(
                            context,
                            MaterialPageRoute <dynamic>(
                              builder: (BuildContext context) => BirthDateRegister(user: user,),
                            ),
                                (route) => false);
                      }
                      //  );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0063C9),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )
                  ),
                  child: Text("Siguiente",
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
    nombreController.text = nombreController.text.trim();
    apellidoMController.text = apellidoMController.text.trim();
    apellidoMController.text = apellidoMController.text.trim();


    user.nombre = nombreController.text;
    user.apellidoP = apellidoPController.text;
    user.apellidoM = apellidoMController.text;
  }
}

TextEditingController nombreController = TextEditingController();
TextEditingController apellidoPController = TextEditingController();
TextEditingController apellidoMController = TextEditingController();

