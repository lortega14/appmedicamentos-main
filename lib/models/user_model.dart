class User{
   int? id_usuario;
   String? nombre;
   String? apellidoP;
   String? apellidoM;
   String? fechaNac;
   String? telefono;
   String? calle;
   String? club;
   String? numExterior;
   bool? cuidador_activo;
   String? cuidador_nombre;
   String? cuidador_telefono;

  User({
    this.id_usuario,
    this.nombre,
    this.apellidoP,
    this.apellidoM,
    this.fechaNac,
    this.telefono,
    this.calle,
    this.numExterior,
    this.club,
    this.cuidador_activo,
    this.cuidador_nombre,
    this.cuidador_telefono
  });

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id_usuario,
      'nombre': nombre,
      'apellidoP': apellidoP,
      'apellidoM': apellidoM,
      'telefono': telefono,
      'fechaNac': fechaNac,
      'club': club,
      'cuidador_activo': cuidador_activo,
      'cuidador_nombre': cuidador_nombre,
      'cuidador_telefono': cuidador_telefono
    };
  }
}