class Medicament{
  int? id_medicamento;
  String? nombre;
  String? descripcion;
  String? dosis;
  String? inicioToma;
  String? finToma;
  String? frecuenciaTipo;
  int? frecuenciaToma;

  Medicament({
    this.id_medicamento,
    this.nombre,
    this.descripcion,
    this.dosis,
    this.inicioToma,
    this.finToma,
    this.frecuenciaTipo,
    this.frecuenciaToma,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_medicamento': id_medicamento,
      'nombre': nombre,
      'descripcion': descripcion,
      'dosis': dosis,
      'inicioToma': inicioToma,
      'finToma': finToma,
      'frecuenciaTipo': frecuenciaTipo,
      'frecuenciaToma': frecuenciaToma
    };
  }
}