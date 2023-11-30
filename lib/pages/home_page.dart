import 'package:app_medicamentos/models/reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/layout/bottom_navbar.dart';
import 'package:app_medicamentos/pages/calendar/calendar.dart';
import 'package:app_medicamentos/pages/records/records.dart';
import 'package:app_medicamentos/pages/profile/profile_page.dart';
import 'package:app_medicamentos/utils/button.dart';
import 'package:intl/intl.dart';
import 'package:app_medicamentos/utils/texto.dart';
import 'package:app_medicamentos/models/medicament_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:page_transition/page_transition.dart';
import 'package:app_medicamentos/constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    _loadDate();
  }

  void _loadDate() async {
    await initializeDateFormatting('es', null);
    DateTime now = DateTime.now();
    setState(() {
      formattedDate = DateFormat.yMMMMd('es').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    CreateCards(context);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppStyles.primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Icon(Icons.today, color: Colors.black, size: 42),
              SizedBox(width: 16), // Espacio entre el icono y el texto
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hoy',
                    style: AppStyles.encabezado1,
                  ),
                  Text(
                    formattedDate,
                    style: AppStyles.encabezado2,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          height: homePageCards.length * 120,
          child: new ListView(
            children: homePageCards,
          )
        ),

        bottomNavigationBar: Container(
          child: CustomNavigationBar(
          currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (index == 0) {
                //Pagina actual, no necesita navegacion
              } else if (index == 1) {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const CalendarPage(),
                  ),
                  (route) => false,
                );
              } else if (index == 2) {
                muestraButtonSheet();
              } else if (index == 3) {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const RecordsPage(),
                  ),
                      (route) => false,
                );
              } else if (index == 4) {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const ProfilePage(),
                  ),
                      (route) => false,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void muestraButtonSheet(){
    final int bandShow = 0;
    // band: revisar que valor tiene para mostrar los widgets qe necesites
    //final bool num = 0;
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(12.0)
          )
      ),
      context: context,
      builder: (BuildContext context){
        return SizedBox(
            height: 350,
            child: Center(
              // child: bandShow == 1 ? Column(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (bandShow == 0)
                    Column(
                      children: [
                        Button(color: 0xFF0D1C52,
                          ancho: 263,
                          alto: 71,
                          contenido: 'Agregar medicamento',
                          ruta: 0,
                        ),
                        const SizedBox(width: 0.0, height: 60.0,),
                        Button(color: 0xFF0D1C52,
                          ancho: 263,
                          alto: 71,
                          contenido: 'Agregar cita médica',
                          ruta: 1,
                        )
                      ],
                    ),

                  if (bandShow == 1)
                    Column(
                      children: [
                        Texto(contenido: 'Medicamento agregado con éxito',),
                        const SizedBox(width: 0.0, height: 60.0,),
                        Button(color: 0xFF0063C9, ancho: 180, alto: 60, contenido: 'Aceptar', ruta: 2,),
                      ],
                    ),

                  if (bandShow == 2)
                    Column(
                      children: [
                        Texto(contenido: 'Error al agregar medicamento',),
                        const SizedBox(width: 0.0, height: 60.0,),
                        Button(color: 0xFF0063C9, ancho: 180, alto: 60, contenido: 'Aceptar', ruta: 2,),
                      ],
                    ),

                  if (bandShow == 3)
                    Column(
                      children: [
                        Texto(contenido: 'Cita agregada con éxito',),
                        const SizedBox(width: 0.0, height: 60.0,),
                        Button(color: 0xFF0063C9, ancho: 180, alto: 60, contenido: 'Aceptar', ruta: 2,),
                      ],
                    ),

                  if (bandShow == 4)
                    Column(
                      children: [
                        Texto(contenido: 'Error al agregar cita',),
                        const SizedBox(width: 0.0, height: 60.0,),
                        Button(color: 0xFF0063C9, ancho: 180, alto: 60, contenido: 'Aceptar', ruta: 2,),
                      ],
                    )
                ],
              ) ,
            )
        );
      },
    );
  }

  Future<void> CreateCards(var context) async {
    try{
      if(homePageCards.length < 1){
        Database database = await openDatabase(
            Path.join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

        DateTime now = new DateTime.now();
        DateTime date = new DateTime(now.year, now.month, now.day);
        print("SELECT * FROM Medicamento AS M INNER JOIN Recordatorio AS R ON M.id_medicamento = R.id_medicamento WHERE R.fecha_hora LIKE '" + date.toString().split(" ")[0] + "%'");

        final List<Map<String, dynamic>> medicamentos = await database.rawQuery(
          "SELECT * FROM Medicamento AS M INNER JOIN Recordatorio AS R ON M.id_medicamento = R.id_medicamento WHERE R.fecha_hora LIKE '" + date.toString().split(" ")[0] + "%' ORDER BY R.fecha_hora ASC",
        );
        print("map: " + medicamentos.length.toString());
        print("cards: " + homePageCards.length.toString());

        if(medicamentos.length > 0){
          for(int i = 0; i < medicamentos.length; i++){
            String horaOriginal = medicamentos[i]['fecha_hora'].toString().split(" ")[1].split(".")[0];
            // Analiza la hora original en un objeto DateTime
            DateTime horaDateTime = DateTime.parse("2022-01-01 $horaOriginal");
            // Formatea la hora en formato de 12 horas sin segundos
            String horaFormateada = DateFormat('hh:mm a').format(horaDateTime);
            homePageCards.add(Card(
              elevation: 3,
              margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(Icons.medication_liquid, size: 44),
                title: Text(
                  medicamentos[i]['nombre'].toString(),
                  style: AppStyles.tituloCard,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicamentos[i]['dosis'].toString(),
                      style: AppStyles.dosisCard,
                    ),
                  ],
                ),
                trailing: Text(
                  horaFormateada,
                  style: AppStyles.dosisCard,
                ),
              ),
            )
            );
          }

          final List<Map<String, dynamic>> citas = await database.rawQuery(
            "SELECT * FROM Cita AS C INNER JOIN Recordatorio AS R ON C.id_cita = R.id_cita WHERE R.fecha_hora LIKE '" + date.toString().split(" ")[0] + "%' ORDER BY R.fecha_hora ASC",
          );
          print("map: " + citas.length.toString());
          print("cards: " + homePageCards.length.toString());

          if(citas.length > 0) {
            for (int i = 0; i < citas.length; i++) {
              homePageCards.add(Card(
                elevation: 3, // Elevación para dar profundidad al card
                margin: EdgeInsets.fromLTRB(16, 8, 16, 8), // Margen alrededor del card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15), // Borde redondeado con radio de 15
                ),
                child: ListTile(
                  leading: Icon(Icons.medical_services, size: 40),
                  // Icono de medicina a la izquierda
                  title: Text(
                    //citas[i]['motivo'].toString(),
                    'Cita Médica',
                    //Titulo
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hora: ' + citas[i]['fecha_hora'].toString().split(" ")[1].split(".")[0]),
                      Text("Ubicacion: " +
                          citas[i]['ubicacion'].toString()),
                      //Dosis del medicamento
                    ],
                  ),
                  trailing: Text(
                    "Telefono: " +
                        citas[i]['telefono_medico'].toString().split(
                            " ")[0], //Fecha de inicio
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
              );
            }
          }

          if(medicamentos.length > 0 || citas.length > 0)
            Navigator.pushAndRemoveUntil <dynamic>(
              context,
              MaterialPageRoute <dynamic>(
                  builder: (BuildContext context) => const HomePage()
              ),
                  (route) => false,
            );
        }
      }
    }catch(exception){
      print(exception);
    }
  }
}

List<Widget> homePageCards = [];