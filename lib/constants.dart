import 'package:flutter/material.dart';

class AppStyles {

  //MEDIDAS
  static final anchoBoton = 190.0;
  static final altoBoton = 70.0;

  //COLORES
  static const Color primaryBlue = Color(0xFF0063C9);
  static const Color secondaryBlue = Color(0xFF09184D);
  static const Color primaryGrey = Color(0xFF808085);
  static const Color primaryBackground = Color(0xFFEDF2FA);
  static const Color errorColor = Color(0xFFFF1744);
  static const Color sombraForm = Color(0x3F000000);

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
    color: Colors.white,
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
    color: Colors.white,
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
        color: Colors.white,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: InputBorder.none,
    filled: true,
    fillColor: Colors.white,
    errorStyle: AppStyles.textoError,
  );
}