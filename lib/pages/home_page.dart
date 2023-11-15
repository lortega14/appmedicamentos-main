import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/layout/bottom_navbar.dart';
import 'package:app_medicamentos/pages/profile/profile_page.dart';
import 'package:app_medicamentos/utils/button.dart';
import 'package:intl/intl.dart';
import 'package:app_medicamentos/utils/texto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //Intl.defaultLocale = 'es';
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMMd().format(now);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Fondo transparente
          elevation: 0, // Sin sombra
          title: Row(
            children: [
              Icon(Icons.today, color: Colors.black, size: 42), // Icono de calendario
              SizedBox(width: 16), // Espacio entre el icono y el texto
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hoy', // Etiqueta "Hoy"
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ), // Texto en negro
                  ),
                  Text(
                    formattedDate, // Fecha actual con el nombre del mes
                    style: TextStyle(fontSize: 20, color: Colors.black), // Texto en negro
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          height: 100, // Establece la altura del Container a 200 píxeles
          child: Card(
            elevation: 3, // Elevación para dar profundidad al card
            margin: EdgeInsets.all(16), // Margen alrededor del card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Borde redondeado con radio de 15
            ),
            child: ListTile(
              leading: Icon(Icons.medication_liquid, size: 40), // Icono de medicina a la izquierda
              title: Text(
                'Nombre del Medicamento',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tipo de Medicamento'),
                  Text('Dosis'),
                ],
              ),
              trailing: Text(
                '00:00',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
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

              } else if (index == 1) {
                //Calendario
              } else if (index == 2) {
                muestraButtonSheet();
              } else if (index == 3) {
                //Registros
              } else if (index == 4) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              }
            },
          ),
        ),
      ),
    );
  }
  //  void muestraButtonSheet(BuildContext context, int bandShow, String text){PENDIENTE}

  void muestraButtonSheet(){
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
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  //if(num = 0){
                  /* FUNCIONES*/
                  // const SizedBox(width: 0.0, height: 60.0,), YA NO SE UTILIZA
                  /*
                  Button(color: 0xFF0D1C52,
                    ancho: 263,
                    alto: 71,
                    contenido: 'Agregar medicamento',),
                  const SizedBox(width: 0.0, height: 60.0,),
                  Button(color: 0xFF0D1C52,
                      ancho: 263,
                      alto: 71,
                      contenido: 'Agregar cita médica')
*/

                  /* MEDICAMENTO AGREGADO
                 // const SizedBox(width: 0.0, height: 60.0,),
                  Texto(contenido: 'Medicamento agregado con éxito',),
                  const SizedBox(width: 0.0, height: 60.0,),
                  Button(color: 0xFF0063C9, ancho: 180, alto: 60, contenido: 'Aceptar'),
                  */

                  /*ERROR AL AGREGAR EL MEDICAMENTO
                  //const SizedBox(width: 0.0, height: 60.0,),
                  Texto(contenido: 'Error al agregar medicamento',),
                  const SizedBox(width: 0.0, height: 60.0,),
                  Button(color: 0xFF0063C9, ancho: 180, alto: 60, contenido: 'Aceptar'),
                  */


                  /* CITA AGREGADO*/
                  //const SizedBox(width: 0.0, height: 60.0,),
                  Texto(contenido: 'Cita agregada con éxito',),
                  const SizedBox(width: 0.0, height: 60.0,),
                  Button(color: 0xFF0063C9, ancho: 180, alto: 60, contenido: 'Aceptar'),





                  /*ERROR AL AGREGAR LA CITA
                  //const SizedBox(width: 0.0, height: 60.0,),
                  Texto(contenido: 'Error al agregar cita',),
                  const SizedBox(width: 0.0, height: 60.0,),
                  Button(color: 0xFF0063C9, ancho: 180, alto: 60, contenido: 'Aceptar'),
*/

                ],
              ) ,
            )
        );
      },
    );
  }
}
