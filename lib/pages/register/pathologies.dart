import 'package:app_medicamentos/database/conection.dart';
import 'package:app_medicamentos/models/user_model.dart';
import 'package:app_medicamentos/pages/register/name_register.dart';
import 'package:app_medicamentos/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/register/address.dart';
import 'package:app_medicamentos/pages/register/carer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:app_medicamentos/utils/convert_Uppercase.dart';
import 'package:app_medicamentos/constants.dart';


class Pathologies extends StatefulWidget {
  const Pathologies({super.key, required User this.user});

  final User user;

  @override
  State<StatefulWidget> createState() {
    return _Pathologies();
  }
}

class _Pathologies extends State <Pathologies> {
  Singleton singleton = Singleton();
  var patologias;
  final otraspatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List patologias = ['Diabetes Mellitus', 'Hipertensión arterial sistemática', 'Demencia o Alzheimer', 'Artritis', 'Osteoporosis', 'Cardiopatias', 'Parkinson', 'Depresión'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppStyles.primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
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
                    builder: (BuildContext context) => Address(user: widget.user,)
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

      body: SingleChildScrollView(
        // padding: EdgeInsets.only(top: 150),
        child: Form(
          //key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
            //padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Seleccione en caso de tener alguno(s) de estos padecimientos',
                      textAlign: TextAlign.left,
                      style: AppStyles.texto1,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),


                Column(
                  children: [
                    DropDownTextField.multiSelection(
                      //controller: _cntMulti.dropDownValueList,
                      submitButtonColor: AppStyles.primaryBlue,
                      submitButtonText: 'Aceptar',
                      textStyle: AppStyles.texto1,

                      dropdownColor: Color(0xFFF6F5F4),

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
                const SizedBox(height: 50),


                Align(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Otro padecimiento',
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
                        controller: otraspatController,
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: AppStyles.textFieldEstilo,
                        style: AppStyles.texto1,
                        onChanged: (text) {
                          setState(() {
                            convertFirstWordUpperCase(text, otraspatController);
                          });
                        },
                      ),
                    ),
                ),
                const SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 150, 0, 30),
                  child: Container(
                    width: AppStyles.anchoBoton,
                    height: AppStyles.altoBoton,
                    child: ElevatedButton(
                      onPressed: () {
                        print(otraspatController.text);
                        register();
                        Navigator.pushAndRemoveUntil <dynamic>(
                          context,
                          MaterialPageRoute <dynamic>(
                              builder: (BuildContext context) => CarerPage(user: widget.user,)
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
                        style: AppStyles.textoBoton
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

    try {
      await database.transaction((txn) async {
        String sql =
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

        sql =
        'CREATE TABLE Padecimiento (id_padecimiento INTEGER PRIMARY KEY, '
            'nombre_padecimiento TEXT); ';
        txn.rawQuery(sql);

        sql = 'CREATE TABLE Medicamento (id_medicamento INTEGER PRIMARY KEY, '
            'nombre TEXT, '
            'descripcion TEXT,  '
            'dosis TEXT,  '
            'inicioToma REAL,  '
            'finToma REAL,'
            'frecuenciaTipo TEXT,  '
            'frecuenciaToma INTEGER); ';
        txn.rawQuery(sql);

        sql = 'CREATE TABLE Cita (id_cita INTEGER PRIMARY KEY, '
            'nombre_medico TEXT, '
            'motivo TEXT,  '
            'especialidad_medico TEXT,  '
            'ubicacion TEXT,  '
            'telefono_medico TEXT,  '
            'fecha TEXT); ';
        txn.rawQuery(sql);

        sql = 'CREATE TABLE Recordatorio (id_recordatorio INTEGER PRIMARY KEY, '
            'tipo TEXT, '
            'id_medicamento INTEGER,  '
            'id_cita INTEGER, '
            'fecha_hora TEXT);  ';
        txn.rawQuery(sql);

        sql =
        'CREATE TABLE RecordatotioRegistro (id_registro INTEGER PRIMARY KEY, '
            'fecha TEXT); ';
        txn.rawQuery(sql);

        for (int i = 0; i < patologias.length; i++) {
          var padecimiento = {
            'nombre_padecimiento': patologias[i].toString(),
          };

          var id2 = txn.insert('Padecimiento', padecimiento);

          print(padecimiento["nombre_padecimiento"].toString() + " insertado.");
        }

        var otroPadecimiento = {
          'nombre_padecimiento': otraspatController.text,
        };

        var id2 = txn.insert('Padecimiento', otroPadecimiento);
        print(
            otroPadecimiento["nombre_padecimiento"].toString() + " insertado.");
      });
    }catch(exception) {
      print(exception);
    }


    final List<Map<String, dynamic>> r = await database.rawQuery(
      "INSERT INTO RecordatotioRegistro (fecha) VALUES ('" + DateTime.now().toString().split(" ")[0] + "')",
    );
    print("INSERT INTO RecordatotioRegistro (fecha) VALUES ('" + DateTime.now().toString().split(" ")[0] + "')");
  }
}



