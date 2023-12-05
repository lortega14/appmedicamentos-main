import 'package:app_medicamentos/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:app_medicamentos/pages/profile/profile_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditProfile();
  }
}

class _EditProfile extends State <EditProfile> {
  Singleton singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF6F5F4),
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
            icon: Icon(Icons.arrow_back_rounded, color: singleton.interfazColores.getColorDark()),
            onPressed: () {
              Navigator.pushAndRemoveUntil <dynamic>(
                context,
                MaterialPageRoute <dynamic>(
                    builder: (BuildContext context) => ProfilePage()
                ),
                    (route) => false,
              );
            },
          ),
          actions: const [],
          backgroundColor: Color(0xFFF6F5F4),
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: nombreUController,
            obscureText: false,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 1,
                      style: BorderStyle.solid
                  )
              ),
              filled: true,
              fillColor: Color(0xFFFFFFFF),
              hintText: 'Nombre(s)',
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            controller: apellidoUController,
            obscureText: false,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 1,
                      style: BorderStyle.solid

                  )
              ),
              filled: true,
              fillColor: Color(0xFFFFFFFF),
              hintText: 'Apellidos',
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            controller: telefonoUController,
            obscureText: false,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 1,
                      style: BorderStyle.solid

                  )
              ),
              filled: true,
              fillColor: Color(0xFFFFFFFF),
              hintText: 'Teléfono',
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
                  UpdateProfile();
                  Navigator.pushAndRemoveUntil <dynamic>(
                    context,
                    MaterialPageRoute <dynamic>(
                        builder: (BuildContext context) => HomePage()
                    ),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: singleton.interfazColores.getColorNeutral(),
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
    );
  }

  void UpdateProfile() async {
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

    await database.transaction((txn) async {

      var usuario = {
        'cuidador_nombre': nombreUController.text + " " + apellidoUController.text,
        'cuidador_telefono': telefonoUController.text
      };

      var id1 = txn.update('Usuario', usuario);

      print("Usuario actualizado: " + usuario.toString());
    });

    nombreController.text = "";
    apellidoPController.text = "";
    apellidoMController.text = "";
    fechaNacController.text = "";
    calleController.text = "";
    coloniaController.text = "";
    numExteriorController.text = "";
    cuidadorController.text = "";
  }

  TextEditingController nombreUController = TextEditingController();
  TextEditingController apellidoUController = TextEditingController();
  TextEditingController telefonoUController = TextEditingController();
}