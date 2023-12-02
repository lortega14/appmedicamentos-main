import 'package:flutter/material.dart';

class AppStyles {

  //MEDIDAS
  static final anchoBoton = 190.0;
  static final altoBoton = 70.0;

  //COLORES
  static const Color primaryBlue = Color(0xFF9A9996);
  static const Color secondaryBlue = Color(0xFF5E5C64);
  static const Color primaryGrey = Color(0xFF77767B);
  static const Color primaryBackground = Color(0xFFF6F5F4);
  static const Color errorColor = Color(0xFFC01C28);
  static const Color sombraForm = Color(0x3F241F31);

  //TEXTO
  static const TextStyle encabezado1 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle encabezado2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle texto1 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle tituloCard = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle dosisCard = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    color: primaryGrey,
  );

  static const TextStyle textoError = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    color: errorColor,
  );

  static const TextStyle textoBoton = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFFF6F5F4),
  );

  //BOTONES
  static final botonPrincipal = ElevatedButton.styleFrom(
    backgroundColor: primaryBlue,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    )
  );

  //TEXTFORMFIELDS
  static final contenedorTextForm = ShapeDecoration(
    color: Color(0xFFF6F5F4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    shadows: [
      BoxShadow(
        color: sombraForm,
        blurRadius: 5,
        offset: Offset(0, 4),
        spreadRadius: 0,
      )
    ]
  );

  static final textFieldEstilo = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xFFF6F5F4),
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: InputBorder.none,
    filled: true,
    fillColor: Color(0xFFF6F5F4),
    errorStyle: AppStyles.textoError,
  );
}