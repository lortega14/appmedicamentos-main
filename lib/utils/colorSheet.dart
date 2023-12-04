import 'package:app_medicamentos/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/utils/button.dart';
import 'package:app_medicamentos/utils/texto.dart';

import '../pages/profile/profile_page.dart';

void muestraColorSheet(BuildContext context){
  final size = MediaQuery.of(context).size;
  Singleton singleton = Singleton();
  //final int bandShow = 0;
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
          height: size.height*.75,
          child: Center(
            // child: bandShow == 1 ? Column(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(width: 0.0, height: size.height*.01,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3584E4),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),
                          ),
                          //263, 71
                          fixedSize: Size(size.width*.7, (size.height*.75)*.1),
                        ),
                        onPressed: () {
                          singleton.interfazColores = Colores.blue;
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
                        },
                        child: Text(
                          "Azúl",
                          style: TextStyle(color: Color(0xFFF6F5F4), fontSize: 20,fontFamily: 'Roboto', ),
                        )
                    ),
                    SizedBox(width: 0.0, height: size.height*.01,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF33D17A),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),
                          ),
                          //263, 71
                          fixedSize: Size(size.width*.7, (size.height*.75)*.1),
                        ),
                        onPressed: () {
                          singleton.interfazColores = Colores.green;
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
                        },
                        child: Text(
                          "Verde",
                          style: TextStyle(color: Color(0xFFF6F5F4), fontSize: 20,fontFamily: 'Roboto', ),
                        )
                    ),
                    SizedBox(width: 0.0, height: size.height*.01,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE01B24),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),
                          ),
                          //263, 71
                          fixedSize: Size(size.width*.7, (size.height*.75)*.1),
                        ),
                        onPressed: () {
                          singleton.interfazColores = Colores.red;
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
                        },
                        child: Text(
                          "Rojo",
                          style: TextStyle(color: Color(0xFFF6F5F4), fontSize: 20,fontFamily: 'Roboto', ),
                        )
                    ),
                    SizedBox(width: 0.0, height: size.height*.01,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9141AC),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),
                          ),
                          //263, 71
                          fixedSize: Size(size.width*.7, (size.height*.75)*.1),
                        ),
                        onPressed: () {
                          singleton.interfazColores = Colores.purple;
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
                        },
                        child: Text(
                          "Morado",
                          style: TextStyle(color: Color(0xFFF6F5F4), fontSize: 20,fontFamily: 'Roboto', ),
                        )
                    ),
                    SizedBox(width: 0.0, height: size.height*.01,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF986A44),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),
                          ),
                          //263, 71
                          fixedSize: Size(size.width*.7, (size.height*.75)*.1),
                        ),
                        onPressed: () {
                          singleton.interfazColores = Colores.brown;
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
                        },
                        child: Text(
                          "Cafe",
                          style: TextStyle(color: Color(0xFFF6F5F4), fontSize: 20,fontFamily: 'Roboto', ),
                        )
                    ),
                  ],
                ),
              ],
            ) ,
          )
      );
    },
  );
}