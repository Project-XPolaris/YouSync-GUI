import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:yousync/database/sync_folder.dao.dart';
import 'package:yousync/database/sync_folder.dart';
part 'database.g.dart';
@Database(version: 1, entities: [SyncFolder])
abstract class AppDatabase extends FloorDatabase {
  SyncFolderDao get syncFolderDao;
}