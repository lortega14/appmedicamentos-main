import 'package:app_medicamentos/database/conection.dart';
import 'package:app_medicamentos/models/user_model.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/register/address.dart';
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';


class Pathologies extends StatefulWidget {
  const Pathologies({super.key, required User this.user});

  final User user;



  @override
  State<StatefulWidget> createState() {
    return _Pathologies();
  }
}

class _Pathologies extends State <Pathologies> {
  var patologias;
  final otraspatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List patologias = ['Diabetes Mellitus', 'Hipertensión arterial sistemática', 'Demencia o Alzheimer', 'Artritis', 'Osteoporosis', 'Cardiopatias', 'Parkinson', 'Depresión'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEDF2FA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Registro de Paciente',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 29
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF09184D)),
            onPressed: () {
              Navigator.pushAndRemoveUntil <dynamic>(
                context,
                MaterialPageRoute <dynamic>(
                    builder: (BuildContext context) => Address(user: widget.user,)
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

      body: SingleChildScrollView(
        // padding: EdgeInsets.only(top: 150),
        child: Form(
          //key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            //padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Padding(padding: EdgeInsets.only(top: 50)),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Patologías',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '(opcional)',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                const SizedBox(
                  height: 20,
                ),

                Column(

                  children: [
                    DropDownTextField.multiSelection(


                      //controller: _cntMulti.dropDownValueList,
                      //Propiedades botón
                      submitButtonColor: Color(0xFF0063C9),
                      submitButtonText: 'Aceptar',
                      submitButtonTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),



                      dropdownColor: Colors.white,

                      dropdownRadius: 0,
                      //displayCompleteItem: true, //Muestra los campos seleccionados
                      //initialValue: const ["name1", "name2", "name8", "name3"],
                      dropDownItemCount: 10, //La cantidad que te muestra al inicio, lo demás con el scroll
                      dropDownList: const [
                        DropDownValueModel(name: 'Artritis', value: "Artritis", /*toolTipMsg: "DropDownButton is a widget that we can use to select one unique value from a set of values"*/),
                        DropDownValueModel(name: 'Artritis/Osteoartrosis', value: "Osteoartrosis"),
                        DropDownValueModel(name: 'Cardiopatías', value: "Cardiopatías"),
                        DropDownValueModel(name: 'Demencia o Alzheimer', value: "Demencia o Alzheimer"),
                        DropDownValueModel(name: 'Depresión', value: "Depresión"),
                        DropDownValueModel(name: 'Diabetes Mellitus', value: "Diabetes Mellitus"),
                        DropDownValueModel(name: 'Hipertensión arterial sistemática', value: "Hipertensión arterial sistemática", /* Muestra un dialog* toolTipMsg: "DropDownButton is a widget that we can use to select one unique value from a set of values"*/),
                        DropDownValueModel(name: 'Osteoporosis', value: "Osteoporosis"),
                        DropDownValueModel(name: 'Parkinson', value: "Parkinson"),
                        /*
                        DropDownValueModel(name: 'name10', value: "value10"),
                        DropDownValueModel(name: 'name11', value: "value11"),

                        */
                      ],
                      onChanged: (val) {
                        setState(() {

                          for(int i=0; i<val.length; i++) {
                            print(val[i].name);
                          }
                          savePathologies(val);
                        });
                      },
                    ),
                  ],

                ),
                const SizedBox(height: 50,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Otras patologías(s)',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
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
                    controller: otraspatController,
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
                    onChanged: (text) {
                      setState(() {
                        // Verificar si el texto no está vacío
                        if (text.trim().isNotEmpty) {
                          // Convertir la primera letra a mayúscula
                          text = text[0].toUpperCase() + text.substring(1);
                          // Asignar el texto al controlador
                          otraspatController.text = text;

                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Container(
                    width: 193,
                    height: 77,
                    child: ElevatedButton(
                      onPressed: () {
                        print(otraspatController.text);
                        register();
                        Navigator.pushAndRemoveUntil <dynamic>(
                          context,
                          MaterialPageRoute <dynamic>(
                              builder: (BuildContext context) => HomePage()
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
                ),

              ],


            ),


          ),
        ),

      ),
    );
  }

  void savePathologies(dynamic val){
    patologias = val;
  }

  void register() async {
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

    await database.transaction((txn) async {

      String sql=
          'CREATE TABLE Usuario (id_usuario INTEGER PRIMARY KEY, '
          'nombre TEXT, '
          'apellidoP TEXT,  '
          'apellidoM TEXT,  '
          'fechaNac REAL,  '
          'telefono TEXT, '
          'calle TEXT, '
          'club TEXT, '
          'numero_exterior TEXT, '
          'cuidador_activo INTEGER, '
          'cuidador_nombre TEXT, '
          'cuidador_telefono TEXT); ';
      txn.rawQuery(sql);

       sql=
          'CREATE TABLE Padecimiento (id_padecimiento INTEGER PRIMARY KEY, '
          'nombre_padecimiento TEXT); ';
      txn.rawQuery(sql);

      sql =  'CREATE TABLE Medicamento (id_medicamento INTEGER PRIMARY KEY, '
          'nombre TEXT, '
          'descripcion TEXT,  '
          'dosis TEXT,  '
          'inicioToma REAL,  '
          'finToma REAL, '
          'frecuenciaToma INTEGER); ';
      txn.rawQuery(sql);

      sql = 'CREATE TABLE Cita (id_cita INTEGER PRIMARY KEY, '
          'nombre_medico TEXT, '
          'especialidad_medico TEXT,  '
          'ubicacion TEXT,  '
          'telefono_medico TEXT,  '
          'fecha REAL); ';
      txn.rawQuery(sql);

      sql = 'CREATE TABLE Recordatorio (id_recordatorio INTEGER PRIMARY KEY, '
          'tipo TEXT, '
          'id_medicamento INTEGER,  '
          'id_cita);  ';
      txn.rawQuery(sql);

      sql = 'SELECT * FROM Usuario';
      txn.rawQuery(sql);

      var usuario = {
        'nombre': widget.user.nombre,
        'apellidoP': widget.user.apellidoP,
        'apellidoM': widget.user.apellidoM,
        'fechaNac': widget.user.fechaNac.toString(),
        'calle': widget.user.calle,
        'club': widget.user.club,
        'numero_exterior': widget.user.numExterior,
        'cuidador_activo': 0
      };

      var id1 = txn.insert('Usuario', usuario);

      for(int i=0; i<patologias.length; i++) {
        var padecimiento = {
          'nombre_padecimiento': patologias,
        };

        var id2 = txn.insert('Padecimiento', padecimiento);

        print(padecimiento["nombre_padecimiento"].toString() + " insertado.");
      }

      var otroPadecimiento = {
        'nombre_padecimiento': otraspatController.text,
      };

      var id2 = txn.insert('Padecimiento', otroPadecimiento);

      print(otroPadecimiento["nombre_padecimiento"].toString() + " insertado.");
    });
  }
}



