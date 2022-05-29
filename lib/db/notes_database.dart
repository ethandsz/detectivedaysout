import 'dart:async';
import 'dart:async';
import 'dart:core';

import 'package:detectivedaysout/model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;
  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('note.db');
    return _database!;
  }

  Future _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    await db.execute('''
CREATE TABLE $tableNotes(
  ${NoteFields.id} $idType,
  ${NoteFields.compl} $boolType,
  ${NoteFields.closeQuiz} $boolType,
)

''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    //final json = note.toJson();
    //final columns = '${NoteFields.compl},${NoteFields.closeQuiz}';
    //final values = '${json[NoteFields.compl]},${json[NoteFields.closeQuiz]}';
    //final id = await db
    //.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableNotes,
        columns: NoteFields.values,
        where: '${NoteFields.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM $tableNotes');
    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
