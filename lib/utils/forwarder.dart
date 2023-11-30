import 'package:app_medicamentos/models/medicament_model.dart';
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:app_medicamentos/pages/medicaments_register/medicaments_register.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/reminder_model.dart';
import '../pages/start_page.dart';

class Forwarder extends StatefulWidget {
  const Forwarder({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Forwarder();
  }
}

class _Forwarder extends State <Forwarder> {
  @override
  Widget build(BuildContext context) {
    select(context);

    return Scaffold();
  }

  Future<void> select(var context) async {

    try {
      Database database = await openDatabase(
          join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

      final List<Map<String, dynamic>> map1 = await database.rawQuery(
        'SELECT * FROM Usuario LIMIT 1',
      );

      if (map1.length > 0) {
        print(map1[0]['nombre'].toString());

        Reminder reminder = Reminder();
        await reminder.CreateMedicamentsReminders();
        await reminder.SetAlarms();

        Navigator.pushAndRemoveUntil <dynamic>(
          context,
          MaterialPageRoute <dynamic>(
              builder: (BuildContext context) => const HomePage()
          ),
              (route) => false,
        );
      }
    }catch(exception){
      print(exception);
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