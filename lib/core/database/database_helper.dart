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

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

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

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      loginStatusTable,
    );
  }
}
