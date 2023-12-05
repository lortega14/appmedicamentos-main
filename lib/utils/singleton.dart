import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum Colores {
  blue(dark: Color(0xFF1A5FB4), neutral: Color(0xFF3584E4), light: Color(0xFFc1d7f1)),
  green(dark: Color(0xFF26A269), neutral: Color(0xFF33D17A), light: Color(0xFFc0f0ca)),
  //yellow(dark: 0xFFE5A50A, neutral: 0xFFF6D32D),
  //ornge(dark: 0xFFC64600, neutral: 0xFFFF7800),
  red(dark: Color(0xFFA51D2D), neutral: Color(0xFFE01B24), light: Color(0xFFf6b3ac)),
  purple(dark: Color(0xFF613583), neutral: Color(0xFF9141AC), light: Color(0xFFdca6dd)),
  brown(dark: Color(0xFF63452C), neutral: Color(0xFF986A44), light: Color(0xFFcdbcae)),
  ;

  const Colores({
    required this.dark,
    required this.neutral,
    required this.light,
  });

  final dark;
  final neutral;
  final light;

  Color getColorNeutral(){
    return neutral;
  }

  Color getColorDark(){
    return dark;
  }

  Color getColorLight(){
    return light;
  }
}

class Singleton{
  static Singleton? _instance;

  Singleton._internal() {
    _instance = this;
  }

  factory Singleton() => _instance ?? Singleton._internal();

  var interfazColores = Colores.red;

  XFile ? _selectedPicture;

  saveImage(XFile? picture){
    _selectedPicture = picture;
  }

  XFile? returnImage(){
    return _selectedPicture;
  }
}