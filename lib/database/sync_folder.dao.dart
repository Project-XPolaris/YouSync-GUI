import 'package:floor/floor.dart';
import 'package:yousync/api/sync_folder.dart';
import 'package:yousync/database/sync_folder.dart';

@dao
abstract class SyncFolderDao {
  @Query('SELECT * FROM SyncFolder')
  Future<List<SyncFolder>> findAllSyncFolders();

  @insert
  Future<void> insertSyncFolder(SyncFolder folder);

  @delete
  Future<void> deleteSyncFolder(SyncFolder syncFolder);

  @delete
  Future<int> deleteSyncFolders(List<SyncFolder> syncFolders);
}