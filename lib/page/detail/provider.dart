import 'package:flutter/material.dart';
import 'package:yousync/database/helper.dart';
import 'package:yousync/database/sync_folder.dart';

class DetailProvider extends ChangeNotifier {
  SyncFolder folder;
  DetailProvider(this.folder);

  changeSyncFileList(bool isSync) async {
    var database = await DatabaseHelper().getDatabase();
    folder.syncFileList = isSync;
    await database.syncFolderDao.updateSyncFolder(folder);
    notifyListeners();
  }
  changeLocalPath(String localPath) async {
    var database = await DatabaseHelper().getDatabase();
    folder.localPath = localPath;
    await database.syncFolderDao.updateSyncFolder(folder);
    notifyListeners();
  }
}