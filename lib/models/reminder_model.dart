import 'package:app_medicamentos/models/appointment_model.dart';
import 'package:app_medicamentos/models/medicament_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class Reminder{
  int? id_recordatorio;
  String? tipo;
  int? id_medicamento;
  int? id_cita;
  String? fecha_hora;

  Reminder({
    this.id_recordatorio,
    this.tipo,
    this.id_medicamento,
    this.id_cita,
    this.fecha_hora,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_recordatorio': id_recordatorio,
      'tipo': tipo,
      'id_medicamento': id_medicamento,
      'id_cita': id_cita,
      'fecha_hora': fecha_hora,
    };
  }

  void InsertReminder() async{
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

    await database.transaction((txn) async {

      var recordatorio = toMap();

      var id1 = txn.insert('Recordatorio', recordatorio);

      print("Recordatorio insertado\n" + toMap().toString());
    });
  }

  SetAlarms() async {
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

    print("SELECT DISTINCT(fecha_hora) FROM Recordatorio WHERE fecha_hora like '" + DateTime.now().toString().split(" ")[0] + "%'");

    final List<Map<String, dynamic>> horas = await database.rawQuery(
    "SELECT DISTINCT(fecha_hora) AS fecha_hora FROM Recordatorio WHERE fecha_hora like '" + DateTime.now().toString().split(" ")[0] + "%'",
    );

    String mensaje = "";
    for(int i = 0; i < horas.length; i++){
      mensaje = "";
      final List<Map<String, dynamic>> mRecordatorios = await database.rawQuery(
        "SELECT * FROM Medicamento AS M INNER JOIN Recordatorio AS R ON M.id_medicamento = R.id_medicamento WHERE R.fecha_hora LIKE '" + horas[i]["fecha_hora"] + "%'",
      );
      if(mRecordatorios.length > 0)
        mensaje += "Medicamentos: ";
      for(int j = 0; j < mRecordatorios.length; j++){
        mensaje += mRecordatorios[j]["nombre"].toString() + ", ";
      }
      if(mRecordatorios.length > 0)
        mensaje = mensaje.substring(0, mensaje.length - 2) + "\n";

      final List<Map<String, dynamic>> cRecordatorios = await database.rawQuery(
        "SELECT * FROM Cita AS C INNER JOIN Recordatorio AS R ON C.id_cita = R.id_cita WHERE R.fecha_hora LIKE '" + horas[i]["fecha_hora"] + "%'",
      );
      if(cRecordatorios.length > 0)
        mensaje += "Citas: ";
      for(int j = 0; j < cRecordatorios.length; j++){
        mensaje += cRecordatorios[j]["motivo"].toString() + ", ";
      }
      if(cRecordatorios.length > 0)
        mensaje = mensaje.substring(0, mensaje.length - 2);

      String HoraAlarma = horas[i]["fecha_hora"].toString().split(" ")[1].split(":")[0];
      String MinutoAlarma = horas[i]["fecha_hora"].toString().split(" ")[1].split(":")[1];
      FlutterAlarmClock.createAlarm(
        hour: int.parse(HoraAlarma),
        minutes: int.parse(MinutoAlarma),
        title: mensaje,
      );
    }
  }


  CreateMedicamentsReminders() async{
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

    final List<Map<String, dynamic>> registro = await database.rawQuery(
      'SELECT * FROM RecordatotioRegistro ORDER BY id_registro DESC',
    );

    for(int i = 0; i < registro.length; i++){
      print(registro[i]['fecha'].toString() + " 00:00:00");
    }
    DateTime now = DateTime.now();
    print("Dias restantes: " + (30 - DateTime.parse(registro[0]['fecha'].toString() + " 00:00:00").difference(DateTime(now.year, now.month, now.day)).inDays * -1).toString());

    if(DateTime.parse(registro[0]['fecha'].toString() + " 00:00:00").difference(DateTime(now.year, now.month, now.day)).inDays * -1 > 30){

      final List<Map<String, dynamic>> medicamentos = await database.rawQuery(
        'SELECT * FROM Medicamento',
      );

      for(int i = 0; i < medicamentos.length; i++){
        Medicament medicament = Medicament(id_medicamento: int.parse(medicamentos[i]['id_medicamento'].toString()),
                                          frecuenciaTipo: medicamentos[i]['frecuenciaTipo'].toString(),
                                          frecuenciaToma: int.parse(medicamentos[i]['frecuenciaToma'].toString()));

        CreateMedicamentReminders(medicament);
      }

    }
  }

  CreateMedicamentReminders(Medicament medicament) async{
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

    final List<Map<String, dynamic>> lastReminder = await database.rawQuery(
      'SELECT * FROM Recordatorio WHERE id_medicamento =' + medicament.id_medicamento.toString() + ' ORDER BY fecha_hora DESC LIMIT 1',
    );

    print("Id medicamento: " + medicament.id_medicamento.toString());

    for(int i = 0; i < lastReminder.length; i++){
      print(lastReminder[0]['id_recordatorio'].toString() + " - " + lastReminder[0]['id_medicamento'].toString() + " - " + lastReminder[0]['fecha_hora'].toString());
    }

    int count = 0;
    DateTime lastFechaHora = DateTime.parse(lastReminder[0]['fecha_hora'].toString());
    DateTime fechaHora = lastFechaHora;
    DateTime now = DateTime.now();
    while(lastFechaHora.difference(DateTime(fechaHora.year, fechaHora.month, fechaHora.day)).inDays * -1 < 31){
      count ++;
      switch(medicament.frecuenciaTipo){
        case "Hora":
          fechaHora = DateTime(fechaHora.year, fechaHora.month, fechaHora.day, fechaHora.hour + int.parse(medicament.frecuenciaToma.toString()), fechaHora.minute);
        case "Dia":
          fechaHora = DateTime(fechaHora.year, fechaHora.month, fechaHora.day + int.parse(medicament.frecuenciaToma.toString()), fechaHora.hour, fechaHora.minute);
        case "Semana":
          fechaHora = DateTime(fechaHora.year, fechaHora.month, fechaHora.day + (int.parse(medicament.frecuenciaToma.toString()) * 7), fechaHora.hour, fechaHora.minute);
        case "Mes":
          fechaHora = DateTime(fechaHora.year, fechaHora.month  + int.parse(medicament.frecuenciaToma.toString()), fechaHora.day, fechaHora.hour, fechaHora.minute);
      }

      Reminder reminder = Reminder(tipo: "M", id_medicamento: medicament.id_medicamento, fecha_hora: fechaHora.toString());

      /*String HoraAlarma = fechaHora.toString().split(" ")[1].split(":")[0];
      String MinutoAlarma = fechaHora.toString().split(" ")[1].split(":")[1];
      FlutterAlarmClock.createAlarm(
          hour: int.parse(HoraAlarma),
          minutes: int.parse(MinutoAlarma),
          title: 'Hora de tomar sus medicamentos:' + medicament.nombre.toString(),
      );*/

      reminder.InsertReminder();
    }
    print("Recordatorios de " + medicament.nombre.toString() + ": " + count.toString());
  }

  CreateAppointmentReminders(Appointment appointment) async{
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

    Reminder reminder = Reminder(tipo: "C", id_cita: appointment.id_cita, fecha_hora: appointment.fecha);

    /*String HoraAlarma = appointment.fecha.toString().split(" ")[1].split(":")[0];
    String MinutoAlarma = appointment.fecha.toString().split(" ")[1].split(":")[1];
    FlutterAlarmClock.createAlarm(
        hour: int.parse(HoraAlarma),
        minutes: int.parse(MinutoAlarma),
        title: 'Hora de asistir a su cita medica'
    );*/
    reminder.InsertReminder();

    print(appointment.id_cita.toString() +" Recordatorio de cita con " + appointment.nombre_medico.toString() + " el dia " + appointment.fecha.toString());
  }

}