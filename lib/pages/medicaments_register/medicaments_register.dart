import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:app_medicamentos/pages/medicaments_register/medicaments_register_date.dart';
import 'package:app_medicamentos/models/medicament_model.dart';
import 'package:app_medicamentos/utils/convert_Uppercase.dart';

enum Frequency { horas, dias, semanas, meses  }

class MedicamentNameRegister extends StatefulWidget {
  const MedicamentNameRegister({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MedicamentNameRegister();
  }
}

class _MedicamentNameRegister extends State <MedicamentNameRegister> {
  final Medicament medicament = Medicament();
  final  freqHour = TextEditingController();
  final  freqDay = TextEditingController();
  final  freqWeek = TextEditingController();
  final  freqMonth = TextEditingController();

  Frequency? _frequency = Frequency.horas;

  bool isContainerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEDF2FA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Agregar medicamento',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF09184D)),
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
          backgroundColor: const Color(0xFFEDF2FA),
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
                    'Nombre del medicamento',
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
                  controller: nombreController,
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
                      convertFirstWordUpperCase(text, nombreController);
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
                    'Dosis',
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
                  controller: dosisController,
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
                ),
              ),

              const SizedBox(height: 20.0,),
              //AQUI INKWELL
              InkWell(
                child: Container(
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
                  padding: EdgeInsets.all(16.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Frecuencia', style: TextStyle(fontSize: 20),),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                onTap: () {
                  print('Contenedor visible');
                  setState(() {
                    isContainerVisible = !isContainerVisible;
                    print(freqDay);
                  });
                },
              ),
              Visibility(
                visible: isContainerVisible,
                child: Container(
                  margin: EdgeInsets.only(top: 3.0),
                  padding: EdgeInsets.all(16.0),
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

                  child: Column(
                    children: <Widget>[
                      RadioListTile<Frequency>(
                        activeColor: Color(0xFF0D1C52),
                        title: Row(
                          children: [
                            Container(
                              width: 50,
                              child: TextFormField(
                                controller: freqHour,
                                obscureText: false,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF0D1C52),),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Text('Horas',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        value: Frequency.horas,
                        groupValue: _frequency,
                        onChanged: (Frequency? value) {
                          setState(() {
                            _frequency = value;
                          });
                        },
                      ),

                      RadioListTile<Frequency>(
                        activeColor: Color(0xFF0D1C52),
                        title: Row(
                          children: [
                            Container(

                              width: 50,
                              child: TextFormField(
                                controller: freqDay,
                                obscureText: false,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF0D1C52),),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Text('Días',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        value: Frequency.dias,
                        groupValue: _frequency,
                        onChanged: (Frequency? value) {
                          setState(() {
                            _frequency = value;
                          });
                        },
                      ),

                      RadioListTile<Frequency>(
                        activeColor: Color(0xFF0D1C52),
                        title: Row(
                          children: [
                            Container(
                              width: 50,
                              child: TextFormField(
                                controller: freqWeek,
                                obscureText: false,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF0D1C52)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Text('Semanas',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        value: Frequency.semanas,
                        groupValue: _frequency,
                        onChanged: (Frequency? value) {
                          setState(() {
                            _frequency = value;
                          });
                        },
                      ),

                      RadioListTile<Frequency>(
                        activeColor: Color(0xFF0D1C52),
                        title: Row(
                          children: [
                            Container(
                              width: 50,
                              child: TextFormField(
                                controller: freqMonth,
                                obscureText: false,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF0D1C52)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Text('Meses',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        value: Frequency.meses,
                        groupValue: _frequency,
                        onChanged: (Frequency? value) {
                          setState(() {
                            print(freqMonth);
                            _frequency = value;
                          });
                        },
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Container(
                  width: 193,
                  height: 77,
                  child: ElevatedButton(
                    onPressed: () {
                      SetMedicamento();
                      Navigator.pushAndRemoveUntil <dynamic>(
                        context,
                        MaterialPageRoute <dynamic>(
                            builder: (BuildContext context) => MedicamentDateRegister(medicament: medicament,)
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
              )
            ],
          ),
        ),
      ),
    );
  }
  void SetMedicamento(){
    medicament.nombre = nombreController.text;
    medicament.dosis = dosisController.text;

    switch(_frequency){
      case Frequency.horas:
        medicament.frecuenciaTipo = "Hora";
        medicament.frecuenciaToma = int.parse(freqHour.text);
      case Frequency.dias:
        medicament.frecuenciaTipo = "Dia";
        medicament.frecuenciaToma = int.parse(freqDay.text);
      case Frequency.semanas:
        medicament.frecuenciaTipo = "Semana";
        medicament.frecuenciaToma = int.parse(freqWeek.text);
      case Frequency.meses:
        medicament.frecuenciaTipo = "Mes";
        medicament.frecuenciaToma = int.parse(freqMonth.text);
      case null:
    }
  }

}
TextEditingController nombreController = TextEditingController();
TextEditingController dosisController = TextEditingController();