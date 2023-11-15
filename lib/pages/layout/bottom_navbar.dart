import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0063C9), // Cambia el color de fondo
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
            width: 60, // Ancho del botón central
            height: 60, // Alto del botón central
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF09184D),// Cambia el color del fondo circular
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white, size: 32), // Ajusta el tamaño y color del icono "+"
              onPressed: () {
                onTap(2);
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
