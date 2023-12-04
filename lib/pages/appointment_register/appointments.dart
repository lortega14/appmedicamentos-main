import 'package:app_medicamentos/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:app_medicamentos/pages/appointment_register/appointments_date.dart';
import 'package:app_medicamentos/models/appointment_model.dart';
import 'package:app_medicamentos/utils/convert_Uppercase.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppointmentsPage();
  }
}

class _AppointmentsPage extends State <AppointmentsPage> {
  Singleton singleton = Singleton();

  var maskFormatter = MaskTextInputFormatter(mask: '### ### ####', filter: {"#": RegExp(r'[0-9]')});

  final  Appointment appointment = Appointment();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF6F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Agendar cita',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: singleton.interfazColores.getColorDark()),
            onPressed: () {
              Navigator.pushAndRemoveUntil <dynamic>(
                context,
                MaterialPageRoute <dynamic>(
                    builder: (BuildContext context) => HomePage()
                ),
                    (route) => false,
              );
            },
          ),
          actions: const [],
          backgroundColor: const Color(0xFFF6F5F4),
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Nombre del médico',
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
                  color: Color(0xFFF6F5F4),
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
                  controller: nombreMedicoController,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color(0xFFF6F5F4),
                            width: 1,
                            style: BorderStyle.solid
                        )
                    ),
                    filled: true,
                    fillColor: Color(0xFFF6F5F4),
                  ),
                  onChanged: (text) {
                    setState(() {
                      convertoUpperCase(text, nombreMedicoController, 0);
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Motivo de cita médica',
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
                  color: Color(0xFFF6F5F4),
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
                  controller: motivoController,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color(0xFFF6F5F4),
                            width: 1,
                            style: BorderStyle.solid
                        )
                    ),
                    filled: true,
                    fillColor: Color(0xFFF6F5F4),
                  ),
                  onChanged: (text) {
                    setState(() {
                      convertFirstWordUpperCase(text, motivoController);
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Lugar de cita médica',
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
                  color: Color(0xFFF6F5F4),
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
                  controller: lugarController,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color(0xFFF6F5F4),
                            width: 1,
                            style: BorderStyle.solid
                        )
                    ),
                    filled: true,
                    fillColor: Color(0xFFF6F5F4),
                  ),
                  onChanged: (text) {
                    setState(() {
                      convertFirstWordUpperCase(text, lugarController);
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Teléfono del médico',
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
                  color: Color(0xFFF6F5F4),
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
                  controller: telefonoMedicoController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [maskFormatter],
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color(0xFFF6F5F4),
                            width: 1,
                            style: BorderStyle.solid
                        )
                    ),
                    filled: true,
                    fillColor: Color(0xFFF6F5F4),
                  ),
                ),
              ),
              // SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Container(
                  width: 193,
                  height: 77,
                  child: ElevatedButton(
                    onPressed: () {
                      SetAppointment();
                      Navigator.pushAndRemoveUntil <dynamic>(
                        context,
                        MaterialPageRoute <dynamic>(
                            builder: (BuildContext context) => AppointmentsDatePage(appointment: appointment,)
                        ),
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: singleton.interfazColores.neutral,
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
      )
    );
  }

  void SetAppointment(){
    appointment.nombre_medico = nombreMedicoController.text;
    appointment.motivo = motivoController.text;
    appointment.ubicacion = lugarController.text;
    appointment.telefono_medico = telefonoMedicoController.text.replaceAll(' ', '');
  }
}

TextEditingController nombreMedicoController = TextEditingController();
TextEditingController motivoController = TextEditingController();
TextEditingController lugarController = TextEditingController();
TextEditingController telefonoMedicoController = TextEditingController();
