import 'package:password_gen/app/features/data/model/llist_model.dart';
import 'package:sqflite/sqflite.dart';


late Database db;
Future<void> intDatabase() async {
  db = await openDatabase(
    "password.db",
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE passwordlist (id INTEGER PRIMARY KEY, title TEXT, password TEXT)');
    },
  );
}

Future<void> addPassword(PasswordList value) async {
  await db.rawInsert('INSERT INTO passwordlist(title, password) VALUES(?, ?)',
      [value.title, value.password]);
}

getAllPassword() async {
  List<PasswordList> list = [];
  final value = await db.rawQuery("SELECT * FROM passwordlist");
  for (var map in value) {
    final password = PasswordList.fromMap(map);
    list.add(password);
  }
  return list;
}

Future<void> update() async {}

Future<void> delete(String id) async {
 await db.rawDelete('DELETE FROM passwordlist WHERE id = ?',[id]);
}
