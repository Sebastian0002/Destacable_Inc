import 'package:destacable_inc/data/models/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            user_id TEXT PRIMARY KEY,
            last_updated TIMESTAMP
          )
        ''');
        await db.execute('''
          CREATE TABLE data (
            id TEXT PRIMARY KEY,
            user_id TEXT,
            bank_name TEXT,
            amount REAL,
            rate REAL,
            start_date TEXT,
            end_date TEXT,
            roi INTEGER,
            last_updated TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
          )
        ''');
      },
    );
  }

  Future<List<String>> getUsersId() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return (maps[i]["user_id"]).toString();
    });
  }

  // User Methods
  Future<void> insertUser(String userId) async {
    final db = await database;
    await db.insert(
      'users',
      {
        'user_id': userId,
        'last_updated': DateTime.now().toIso8601String()
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> hasUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('users');
    return result.isNotEmpty;
  }
 
  Future<bool> existUser(String userId) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
        where: 'user_id = ?',
        whereArgs: [userId],
      );
    return result.isNotEmpty;
  }

  //Data Methods
  Future<List<Data>> getDataByUserId(String userId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'data',
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    return List.generate(maps.length, (i) {
      return Data.fromMap(maps[i]);
    });
  }

  Future<void> insertData(Data data, String userId) async {
    const uuid = Uuid();
    final db = await database;
    await db.insert(
      'data',
      {
        'id' : uuid.v4().toString(),
        'user_id': userId,
        'bank_name': data.bankName,
        'amount': data.amount,
        'rate': data.rate,
        'start_date': data.startDate.toIso8601String(),
        'end_date': data.endDate.toIso8601String(),
        'roi': data.roi,
        'last_updated': DateTime.now().toIso8601String()
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateData(Data data) async {
    final db = await database;
    await db.update(
      'data',
      {
        'bank_name': data.bankName,
        'amount': data.amount,
        'rate': data.rate,
        'start_date': data.startDate.toIso8601String(),
        'end_date': data.endDate.toIso8601String(),
        'roi': data.roi,
      },
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  Future<void> deleteData(int id) async {
    final db = await database;
    await db.delete(
      'data',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  
  Future<void> deleteAllData() async {
    final db = await database;
    await db.delete('data');
  }

  Future<void> deleteDatabaseLocal() async {
    String path = join(await getDatabasesPath(), 'users.db');
    await deleteDatabase(path);
  }
}