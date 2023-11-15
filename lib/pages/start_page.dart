import 'package:app_medicamentos/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:app_medicamentos/pages/medicaments_register/medicaments_register.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StartPage();
  }
}

class _StartPage extends State <StartPage> {
  @override
  Widget build(BuildContext context) {
    //select(context);

    return Scaffold(
      backgroundColor: Color(0xFFEDF2FA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(55, 0, 55, 100),
            child: Container(
              child: Image(
                image: AssetImage('assets/images/logo_apesaam.png'),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Container(
              width: 193,
              height: 77,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil <dynamic>(
                      context,
                      MaterialPageRoute <dynamic>(
                          builder: (BuildContext context) => const NameRegister()
                          //builder: (BuildContext context) => const MedicamentNameRegister()
                      ),
                      (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0063C9),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
                child: Text("Registrarse",
                  style: TextStyle(
                    fontSize: 26
                  ),
                ),
              ),
            ),
          )
        ],
      ),
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
            builder: (BuildContext context) => const NameRegister()
        ),
            (route) => false,
      );
    }
  }
}