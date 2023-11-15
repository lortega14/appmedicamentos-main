//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:app_medicamentos/pages/register/address.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../models/user_model.dart';

class BirthDateRegister extends StatefulWidget {
  const BirthDateRegister({required User this.user});

  final  User user;

  @override
  State<StatefulWidget> createState() {

    return _BirthDateRegister();
  }
}

class _BirthDateRegister extends State <BirthDateRegister> {
  var fechaNac;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEDF2FA),
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
                    builder: (BuildContext context) => NameRegister()
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
            SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.single,
              showNavigationArrow: true,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                fechaNac = args.value.toString().split(' ')[0];
                fechaController.text = fechaNac;
              },
              todayHighlightColor: Color(0xFF09184D),
              selectionColor: Color(0xFF09184D),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Fecha de nacimiento',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              controller: fechaController,
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
                hintText: '',
              ),
            ),
            SizedBox(height: 20.0,),

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
                          builder: (BuildContext context) => Address(user: widget.user,)
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
    widget.user.fechaNac = fechaNac.toString();
  }
}

TextEditingController fechaController = TextEditingController();