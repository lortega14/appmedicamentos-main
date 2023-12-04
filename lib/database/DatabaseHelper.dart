import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper{
  static Future<void> createTables(sql.Database database) async {
    await database.execute(""" CREATE TABLE Feedback(
      feedback_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      lastname TEXT,
      fb TEXT,
      rate INTEGER
      )"""
    );
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("feedbackdb.db", version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTables(database);
        });
  }

  static Future<int> createFeedback(String name, String lastname, String fb, int rate) async{
    final db = await SQLHelper.db();

    final feedb = {'name' : name, 'lastname' : lastname, 'fb' : fb, 'rate' : rate};
    final id = await db.insert('Feedback', feedb, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllFeedback() async {
    final db = await SQLHelper.db();
    return db.query('Feedback', orderBy: 'feedback_id');
  }

  static Future<void> deleteFeedback(int id) async {
    final db = await SQLHelper.db();
    try{
      await db.delete('Feedback', where: "feedback_id = ?", whereArgs: [id]);
    }catch(e){
      print(e);
    }
  }
}
