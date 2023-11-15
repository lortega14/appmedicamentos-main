import 'dart:ffi' as ffi;
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/profile/profile_page.dart';
import 'package:app_medicamentos/pages/layout/bottom_navbar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {
  int _currentIndex = 4;
  List<String> user = ["1", "2", "3", "4", "5", "6", "7", "8"];

  @override
  Widget build(BuildContext context) {
    /*var user = [
      widget.nombre,
      widget.apellidoP,
      widget.apellidoM,
      widget.fechaNac.toString(),
      widget.calle,
      widget.colonia,
      widget.numExterior,
      widget.patologia,
    ];*/

    select(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Perfil',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
                Icons.arrow_back_rounded, color: Color(0xFF09184D)),
            onPressed: () {
              Navigator.pushAndRemoveUntil <dynamic>(
                context,
                MaterialPageRoute <dynamic>(
                    builder: (BuildContext context) =>
                        HomePage()
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
        padding: EdgeInsets.all(30.0), // Define el padding deseado
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ' + nombreController.text + ' ' + apellidoPController.text + ' ' + apellidoMController.text,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Fecha de nacimiento: ' + fechaNacController.text,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Dirección: ' + calleController.text + ' ' + numExteriorController.text + ', ' + coloniaController.text,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Cuidador',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        child: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            } else if (index == 1) {
              //Calendario
            } else if (index == 2) {
              //muestraButtonSheet();
            } else if (index == 3) {
              //Registros
            } else if (index == 4) {

            }
          },
        ),
      ),
    );
  }

  Future<void> select(var context) async {

    if(nombreController.text == "" &&
        apellidoPController.text == "" &&
        apellidoMController.text == "" &&
        fechaNacController.text == "" &&
        calleController.text == "" &&
        coloniaController.text == "" &&
        numExteriorController.text == "" &&
        patologiaController.text == ""){
      Database database = await openDatabase(
          join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

      final List<Map<String, dynamic>> map1 = await database.rawQuery(
        'SELECT * FROM Usuario LIMIT 1',
      );
      final List<Map<String, dynamic>> map2 = await database.rawQuery(
        'SELECT * FROM Padecimiento LIMIT 1',
      );

      print("map1: " + map1.length.toString());
      print("map2: " + map2.length.toString());
      print(map1[0]['nombre'].toString());

      nombreController.text = map1[0]['nombre'].toString();
      apellidoPController.text =  map1[0]['apellidoP'].toString();
      apellidoMController.text = map1[0]['apellidoM'].toString();
      fechaNacController.text = map1[0]['fechaNac'].toString();
      calleController.text = map1[0]['calle'].toString();
      coloniaController.text = map1[0]['club'].toString();
      numExteriorController.text = map1[0]['numero_exterior'].toString();
      patologiaController.text = map2[0]['nombre_padecimiento'].toString();

      print(nombreController.text);

      Navigator.pushAndRemoveUntil <dynamic>(
        context,
        MaterialPageRoute <dynamic>(
            builder: (BuildContext context) => const ProfilePage()
        ),
            (route) => false,
      );
    }
  }
}

TextEditingController nombreController = TextEditingController();
TextEditingController apellidoPController = TextEditingController();
TextEditingController apellidoMController = TextEditingController();
TextEditingController fechaNacController = TextEditingController();
TextEditingController calleController = TextEditingController();
TextEditingController coloniaController = TextEditingController();
TextEditingController numExteriorController = TextEditingController();
TextEditingController patologiaController = TextEditingController();