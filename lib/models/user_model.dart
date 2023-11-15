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
   bool? activeCaregiver;
   String? nameCaregiver;
   String? phoneCaregiver;

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
    this.activeCaregiver,
    this.nameCaregiver,
    this.phoneCaregiver
  });

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id_usuario,
      'nombre': nombre,
      'apellidoP': apellidoP,
      'apellidoM': apellidoM,
      'fechaNac': telefono,
      'birthdate': fechaNac,
      'club': club,
      'active_caregiver': activeCaregiver,
      'name_caregiver': nameCaregiver,
      'caregiver_phone': phoneCaregiver
    };
  }
}