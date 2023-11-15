import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';

class Conection{
  Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'medicamentos.db')
    );
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final adultoMayor = openDatabase(
    join(await getDatabasesPath(), 'medicamentos.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE Usuario(id_usuario INTEGER PRIMARY KEY, '
            'nombre TEXT, '
            'apellidoP TEXT,  '
            'apellidoM TEXT,  '
            'fechaNac REAL,  '
            'telefono TEXT, '
            'calle TEXT'
            'club TEXT, '
            'numero_exterior TEXT'
            'cuidador_activo INTEGER, '
            'cuidador_nombre TEXT, '
            'cuidador_telefono TEXT)',
      );
    },
    version: 1,
  );

  final medicamentos = openDatabase(
    join(await getDatabasesPath(), 'medicamentos.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE Medicamento(id_medicamento INTEGER PRIMARY KEY, '
                                  'nombre TEXT, '
                                  'descripcion TEXT,  '
                                  'dosis TEXT,  '
                                  'inicioToma REAL,  '
                                  'finToma REAL, '
                                  'frecuenciaToma INTEGER)',
      );
    },
    version: 1,
  );

  final citas = openDatabase(
    join(await getDatabasesPath(), 'medicamentos.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE Cita(id_cita INTEGER PRIMARY KEY, '
            'nombre_medico TEXT, '
            'especialidad_medico TEXT,  '
            'ubicacion TEXT,  '
            'telefono_medico TEXT,  '
            'fecha REAL, ',
      );
    },
    version: 1,
  );

  final recordatorios = openDatabase(
    join(await getDatabasesPath(), 'medicamentos.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE Recordatorio(id_recordatorio INTEGER PRIMARY KEY, '
            'tipo TEXT, '
            'id_medicamento INTEGER,  '
            'id_cita,  ',
      );
    },
    version: 1,
  );

  final padecimientos = openDatabase(
    join(await getDatabasesPath(), 'medicamentos.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE Padecimiento(id_padecimiento INTEGER PRIMARY KEY, '
            'nombre_padecimiento TEXT, ',
      );
    },
    version: 1,
  );
}