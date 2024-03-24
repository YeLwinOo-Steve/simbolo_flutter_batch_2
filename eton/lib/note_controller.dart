import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' show join;
import 'note_model.dart';

class NoteController extends GetxController {
  late Database _database;
  RxList<Note> notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  Future<void> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'notes.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY,
            title TEXT,
            content TEXT
          )
        ''');
      },
    );
    getNotes();
  }

  Future<void> getNotes() async {
    final List<Map<String, dynamic>> maps = await _database.query('notes');
    notes.value = List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }

  Future<void> addNote(String title, String content) async {
    await _database.insert('notes', {'title': title, 'content': content});
    getNotes();
  }

  Future<void> updateNote(int id, String title, String content) async {
    await _database.update(
      'notes',
      {'title': title, 'content': content},
      where: 'id = ?',
      whereArgs: [id],
    );
    getNotes();
  }

  Future<void> deleteNote(int id) async {
    await _database.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
    getNotes();
  }
}
