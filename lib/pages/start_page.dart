import 'package:app_medicamentos/pages/home_page.dart';
import 'package:app_medicamentos/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app_medicamentos/constants.dart';

class StartPage extends StatefulWidget {

  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StartPage();
  }
}

class _StartPage extends State <StartPage> {
  Singleton singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    //select(context);

    return Scaffold(
      backgroundColor: AppStyles.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(55, 150, 55, 200),
                child: Container(
                  child: Image(
                    image: AssetImage('assets/images/start_image.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Container(
                  width: AppStyles.anchoBoton,
                  height: AppStyles.altoBoton,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil <dynamic>(
                        context,
                        MaterialPageRoute <dynamic>(
                            builder: (BuildContext context) => const NameRegister()
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
                    child: Text("Registrarse",
                      style: AppStyles.textoBoton,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      )
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