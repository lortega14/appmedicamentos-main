import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:app_medicamentos/utils/forwarder.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/start_page.dart';
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:app_medicamentos/pages/appointment_register/appointments.dart';
import 'package:app_medicamentos/pages/profile/edit_profile.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //select(context);


    return MaterialApp(
      title: 'Flutter Demo',
      //home: HomePage(),
      home: StartPage(),
      //home: AppointmentsPage(),
      //home: Forwarder(),
    );
  }


  Future<void> select(var context) async {
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

    final List<Map<String, dynamic>> map1 = await database.rawQuery(
      'SELECT * FROM Usuario LIMIT 1',
    );

    if(map1.length > 0) {
      print(map1[0]['nombre'].toString());

      Navigator.pushAndRemoveUntil <dynamic>(
        context,
        MaterialPageRoute <dynamic>(
            builder: (BuildContext context) => const HomePage()
        ),
            (route) => false,
      );
    }else{
      Navigator.pushAndRemoveUntil <dynamic>(
        context,
        MaterialPageRoute <dynamic>(
            builder: (BuildContext context) => const StartPage()
        ),
            (route) => false,
      );
    }
  }
}
