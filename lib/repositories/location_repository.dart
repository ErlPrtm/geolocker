import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/location_model.dart';

class LocationRepository {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'locations.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE locations(id INTEGER PRIMARY KEY, date TEXT, latitude REAL, longitude REAL, address TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> saveLocation(LocationModel location) async {
    final db = await database;
    await db.insert('locations', location.toMap());
  }

  Future<List<LocationModel>> getLocations() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('locations');
    return maps.map((map) => LocationModel.fromMap(map)).toList();
  }

  Future<void> clearLocations() async {
    final db = await database;
    await db.delete('locations');
  }
}