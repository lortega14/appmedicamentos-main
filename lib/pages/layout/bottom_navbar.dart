import 'package:app_medicamentos/utils/singleton.dart';
import 'package:flutter/material.dart';
/*import 'package:app_medicamentos/utils/button.dart';
import 'package:app_medicamentos/utils/texto.dart';*/
import 'package:app_medicamentos/utils/buttonSheet.dart';
import 'package:app_medicamentos/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  Singleton singleton = Singleton();

  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final int bandShow = 0;
    return Container(
      color: singleton.interfazColores.getColorNeutral(), // Cambia el color de fondo
      height: 55, // Ajusta la altura del contenedor para hacer la barra de navegación más grande
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: currentIndex == 0 ? singleton.interfazColores.getColorLight() : Color(0xFFF6F5F4), size: 32),
            onPressed: () {
              onTap(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_month, color: currentIndex == 1 ? singleton.interfazColores.getColorLight() : Color(0xFFF6F5F4), size: 32),
            onPressed: () {
              onTap(1);
            },
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: singleton.interfazColores.getColorDark(),
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: Color(0xFFF6F5F4), size: 32),
              onPressed: () {
                //onTap(2);
                muestraButtonSheet(context, bandShow);
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit_note, color: currentIndex == 3 ? singleton.interfazColores.getColorLight() : Color(0xFFF6F5F4), size: 32),
            onPressed: () {
              onTap(3);
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: currentIndex == 4 ? singleton.interfazColores.getColorLight() : Color(0xFFF6F5F4), size: 32),
            onPressed: () {
              onTap(4);
            },
          ),
        ],
      ),
    );
  }
  
}
