import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';
  static final loginStatusTable = 'loginStatusTable';

  static final columnFirstName = 'firstName';
  static final columnLastName = 'lastName';
  static final columnEmail = 'email';
  static final columnPassword = 'password';
  static final columnGender = 'gender';
  static final columnPhones = 'phones';
  static final columnAddresses = 'addresses';
  static final columnImage = 'image';
  static final columnBirth = 'birth';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnFirstName,
            $columnLastName,
            $columnEmail,
            $columnPassword,
            $columnGender,
            $columnAddresses,
            $columnImage,
            $columnPhones,
            $columnBirth
          )
          ''');
    await db.execute('''
          CREATE TABLE $loginStatusTable (
            $columnFirstName,
            $columnLastName,
            $columnEmail,
            $columnPassword,
            $columnGender,
            $columnAddresses,
            $columnImage,
            $columnPhones,
            $columnBirth
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> saveMyUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(loginStatusTable, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> getMyUser() async {
    Database db = await instance.database;
    return await db.query(loginStatusTable);
  }

  Future<int> delete() async {
    Database db = await instance.database;
    return await db.delete(table);
  }
}
