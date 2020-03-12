import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter_widget1/Database/Note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createHelper();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createHelper();
    }
    return _databaseHelper;
  }

  String noteTable = "note_table";
  String noteId = "id";
  String noteTitle = "title";
  String noteDiscription = "discription";
  String noteDate = "date";
  String notePriority = "priority";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  ///Initialize database and create table
  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $noteTable($noteId INTEGER PRIMARY KEY AUTOINCREMENT, $noteTitle TEXT, '
            '$noteDiscription TEXT, $notePriority INTEGER, $noteDate TEXT)');
        //"CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT, date TEXT)";
        //"CREATE TABLE note_table(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, discription TEXT, priority INTEGER, date TEXT)");
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Note>> fetchNotesList() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Note.
    final List<Map<String, dynamic>> maps = await db.query(noteTable);

    // Convert the List<Map<String, dynamic> into a List<Notes>.
    return List.generate(maps.length, (i) {
      return Note.fromMapObject(maps[i]);
    });
  }


  // Define a function that inserts Note into the database
  Future<int> insertNote(Note note) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the note into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same note is inserted twice.
    //

    print(note.toMap());
    // In this case, replace any previous data.
    var result = await db.insert(
      noteTable,
      note.toMap(),
    );
    print(note.priority);
    return result;
  }
  //Update the note
  Future<int> updateNote(Note note) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given note.
    var result = await db.update(
      noteTable,
      note.toMap(),
      // Ensure that the note has a matching id.
      where: "id = ?",
      // Pass the note's id as a whereArg to prevent SQL injection.
      whereArgs: [note.id],
    );
    return result;
  }

  //Delete from note
  Future<int> deleteNote(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the Database.
    var result = await db.delete(
      noteTable,
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    return result;
  }
}
