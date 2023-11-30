/*
 * Función que se encarga de capitalizar la primera letra de cada palabra
 * @param:
 * text: Recibe el texto
 * nameController: Recibe la variable del controller
 * validate: Recibe la variable para validar la variable controller
 * Devuelve: No devuelve nada
 */
void convertoUpperCase(text, nameController, validate){
  if (text.trim().isNotEmpty) {
// Dividir el texto por espacios y capitalizar la primera letra de cada palabra
    List<String> words = text.split(' ');
    for (int i = 0; i < words.length; i++) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }
// Unir las palabras de nuevo con espacios y asignar al controlador
    nameController.text = words.join(' ');
    validate = false;
  }
}

/*
 * Función que se encarga de capitalizar solo la primera letra inicial de la palabra
 * @param:
 * text: Recibe el texto
 * nameController: Recibe la variable del controller
 * validate: Recibe la variable para validar la variable controller
 * Devuelve: No devuelve nada
 */
void convertFirstWordUpperCase(text, nameController){
  // Verificar si el texto no está vacío
  if (text.trim().isNotEmpty) {
    // Convertir la primera letra a mayúscula
    text = text[0].toUpperCase() + text.substring(1);
    // Asignar el texto al controlador
    nameController.text = text;
  }
}