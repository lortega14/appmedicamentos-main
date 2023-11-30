import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/register/birth_date_register.dart';
import 'package:app_medicamentos/pages/register/pathologies.dart';
import 'package:app_medicamentos/utils/convert_Uppercase.dart';
import '../../models/user_model.dart';
import 'package:app_medicamentos/constants.dart';

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
      backgroundColor: AppStyles.primaryBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text(
            'Registro',
            style: AppStyles.encabezado1
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
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
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Ingrese su domicilio (opcional)',
                  textAlign: TextAlign.left,
                  style: AppStyles.texto1,
                ),
              ),
            ),
            SizedBox(height: 20.0),

            Align(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Calle',
                  textAlign: TextAlign.left,
                  style: AppStyles.texto1,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: AppStyles.contenedorTextForm,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: calleController,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: AppStyles.textFieldEstilo,
                  style: AppStyles.texto1,
                  onChanged: (text) {
                    setState(() {
                      convertFirstWordUpperCase(text, calleController);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30.0),


            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Colonia',
                  textAlign: TextAlign.left,
                  style: AppStyles.texto1
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: AppStyles.contenedorTextForm,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: coloniaController,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: AppStyles.textFieldEstilo,
                  style: AppStyles.texto1,
                  onChanged: (text) {
                    setState(() {
                      convertFirstWordUpperCase(text, coloniaController);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30.0),


            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Número exterior',
                  textAlign: TextAlign.left,
                  style: AppStyles.texto1
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              decoration: AppStyles.contenedorTextForm,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: numExteriorController,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: AppStyles.textFieldEstilo,
                  style: AppStyles.texto1,
                  onChanged: (text) {
                    setState(() {
                      convertFirstWordUpperCase(text, numExteriorController);
                    });
                  },
                ),
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                width: AppStyles.anchoBoton,
                height: AppStyles.altoBoton,
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
                  style: AppStyles.botonPrincipal,
                  child: const Text("Siguiente",
                    style: AppStyles.textoBoton
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