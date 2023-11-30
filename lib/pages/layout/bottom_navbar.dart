import 'package:flutter/material.dart';
/*import 'package:app_medicamentos/utils/button.dart';
import 'package:app_medicamentos/utils/texto.dart';*/
import 'package:app_medicamentos/utils/buttonSheet.dart';
import 'package:app_medicamentos/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final int bandShow = 0;
    return Container(
      color: AppStyles.primaryBlue, // Cambia el color de fondo
      height: 55, // Ajusta la altura del contenedor para hacer la barra de navegación más grande
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: currentIndex == 0 ? Colors.grey : Colors.white, size: 32),
            onPressed: () {
              onTap(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_month, color: currentIndex == 1 ? Colors.grey : Colors.white, size: 32),
            onPressed: () {
              onTap(1);
            },
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppStyles.secondaryBlue,
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white, size: 32),
              onPressed: () {
                //onTap(2);
                muestraButtonSheet(context, bandShow);
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit_note, color: currentIndex == 3 ? Colors.grey : Colors.white, size: 32),
            onPressed: () {
              onTap(3);
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: currentIndex == 4 ? Colors.grey : Colors.white, size: 32),
            onPressed: () {
              onTap(4);
            },
          ),
        ],
      ),
    );
  }
  
}
