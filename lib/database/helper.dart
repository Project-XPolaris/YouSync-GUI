import 'package:yousync/database/database.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  // passes the instantiation to the _instance object
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();
  Future<AppDatabase> getDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database;
  }
}
