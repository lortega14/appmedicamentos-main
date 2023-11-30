class Appointment{
  int? id_cita;
  String? nombre_medico;
  String? especialidad_medico;
  String? motivo;
  String? ubicacion;
  String? telefono_medico;
  String? fecha;

  Appointment({
    this.id_cita,
    this.nombre_medico,
    this.especialidad_medico,
    this.ubicacion,
    this.motivo,
    this.telefono_medico,
    this.fecha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_cita': id_cita,
      'nombre_medico': nombre_medico,
      'especialidad_medico': especialidad_medico,
      'motivo': motivo,
      'ubicacion': ubicacion,
      'telefono_medico': telefono_medico,
      'fecha': fecha,
    };
  }
}