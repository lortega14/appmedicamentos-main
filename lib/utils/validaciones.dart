/*
 * Función que se encarga de validar que sea un nombre
 * @param:
 * string value: Recibe el nombre y apellidos
 * return
 * Devuelve un String
 */

String? validateUser(String value){                                   //\s{0,1} Aceptar 1 o 0 espacios
  Pattern pattern = r'^[a-zA-ZáéíóúÁÉÍÓÚ]+(\s[a-zA-ZáéíóúÁÉÍÓÚ]+){0,2}\s{0,1}$';

  RegExp regexp = RegExp(pattern.toString());
  if(regexp.hasMatch(value)){
    print('acceso');
    return null;

  }else{
    print('acceso denegado');
    return 'false';
  }
}

String? validateApellidos(String value){
                                           //\s{0,1} Aceptar 1 o 0 espacios
  Pattern pattern = r'(^[a-zA-ZáéíóúÁÉÍÓÚ]+$)';
  RegExp regexp = RegExp(pattern.toString());
  if(regexp.hasMatch(value)){
    print('acceso');
    return null;

  }else{
    print('acceso denegado');
    return 'false';
  }
}

/*
 * Función que se encarga de validar que sea un correo electrónico
 * @param:
 * string value: Recibe el correo
 * return
 * Devuelve un String
 */

String? validateEmail(String value){
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regexp = RegExp(pattern.toString());
  if(regexp.hasMatch(value)){
    return 'true';
  }else{
    return 'false';
  }
}