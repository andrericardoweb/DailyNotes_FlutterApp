import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesHelper {
  static final NotesHelper _notesHelper = NotesHelper._internal();
  Database _db;

  factory NotesHelper() {
    return _notesHelper;
  }

  NotesHelper._internal() {}

  get db async {
    if (_db != null) {
      return _db;
    } else {}
  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE annotation (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR, description TEXT, data DATETIME)";
    await db.execute(sql);
  }

  bootDB() async {
    final pathDB = await getDatabasesPath();
    final localDB = join(pathDB, "my_daily_notes.db");

    var db = await openDatabase(localDB, version: 1, onCreate: _onCreate);
    return db;
  }
}
