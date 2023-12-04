import 'package:app_medicamentos/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/utils/button.dart';
import 'package:app_medicamentos/utils/texto.dart';

void muestraButtonSheet(BuildContext context, int bandShow){
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
                      Button(color: singleton.interfazColores.dark.value,
                        ancho: 263,
                        alto: 71,
                        contenido: 'Agregar medicamento',
                        ruta: 0,
                      ),
                      const SizedBox(width: 0.0, height: 60.0,),
                      Button(color: singleton.interfazColores.dark.value,
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
                      Button(color: singleton.interfazColores.neutral.value, ancho: 180, alto: 60, contenido: 'Aceptar', ruta: 2,),
                    ],
                  ),

                if (bandShow == 2)
                  Column(
                    children: [
                      Texto(contenido: 'Error al agregar medicamento',),
                      const SizedBox(width: 0.0, height: 60.0,),
                      Button(color: singleton.interfazColores.neutral.value, ancho: 180, alto: 60, contenido: 'Aceptar', ruta: 2,),
                    ],
                  ),

                if (bandShow == 3)
                  Column(
                    children: [
                      Texto(contenido: 'Cita agregada con éxito',),
                      const SizedBox(width: 0.0, height: 60.0,),
                      Button(color: singleton.interfazColores.neutral.value, ancho: 180, alto: 60, contenido: 'Aceptar', ruta: 2,),
                    ],
                  ),

                if (bandShow == 4)
                  Column(
                    children: [
                      Texto(contenido: 'Error al agregar cita',),
                      const SizedBox(width: 0.0, height: 60.0,),
                      Button(color: singleton.interfazColores.neutral.value, ancho: 180, alto: 60, contenido: 'Aceptar', ruta: 2,),
                    ],
                  )
              ],
            ) ,
          )
      );
    },
  );
}