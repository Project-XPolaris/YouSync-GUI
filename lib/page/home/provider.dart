import 'package:flutter/material.dart';
import 'package:yousync/database/database.dart';
import 'package:yousync/database/helper.dart';
import 'package:yousync/database/sync_folder.dart';
import 'package:yousync/service/client.dart';

class SyncFolderItem {
  SyncFolder folder;
  bool isSync;
  bool isPull;
  SyncFolderItem(this.folder,{this.isSync = false,this.isPull = false});
  SyncFolderStatus? syncStatus;
  PullFolderStatus? pullStatus;
}
class HomeProvider extends ChangeNotifier {
  List<SyncFolderItem> folders = [];
  bool first = true;
  List<int> SyncFolderId = [];
  refresh({force = false})async{
    if (!first && !force) {
      return;
    }
    first = false;
    AppDatabase appDatabase = await DatabaseHelper().getDatabase();
    var rawFolders = await appDatabase.syncFolderDao.findAllSyncFolders();
    var newFolder = rawFolders.where((left) => !folders.any((right) => left.id == right.folder.id));
    for (var idx = 0;idx < folders.length;idx ++) {
      var newItem = rawFolders.firstWhere((element) => element.id == folders[idx].folder.id);
      folders[idx].folder = newItem;
    }
    folders.addAll(newFolder.map((e) => SyncFolderItem(e)));
    notifyListeners();
  }
  removeSyncFolder(SyncFolder folder) async{
    AppDatabase appDatabase = await DatabaseHelper().getDatabase();
    await appDatabase.syncFolderDao.deleteSyncFolder(folder);
    await refresh(force: true);
  }
  sync(SyncFolder folder) async {
    folders = folders.map((element) {
      if (element.folder.id == folder.id) {
        element.isSync = true;
      }
      return element;
    }).toList();
    notifyListeners();
    try {
      await DefaultSyncClient.syncFolder(folder.localPath, folder.remoteId,onRefresh: (status){
        folders.forEach((element) {
          if (element.folder.id == folder.id) {
            element.syncStatus = status;
          }
        });
        notifyListeners();
      });
    } finally {
      folders.forEach((element) {
        if (element.folder.id == folder.id) {
          element.isSync = false;
          element.syncStatus = null;
        }
      });
      notifyListeners();
    }
  }
  pull(SyncFolder folder)async {
    folders = folders.map((element) {
      if (element.folder.id == folder.id) {
        element.isPull = true;
      }
      return element;
    }).toList();
    notifyListeners();
    try {
      await DefaultSyncClient.pull(folder.localPath,folder.remoteId,onUpdate: (status){
        folders.forEach((element) {
          if (element.folder.id == folder.id) {
            element.pullStatus = status;
          }
        });
        notifyListeners();
      });
    }finally {
      folders = folders.map((element) {
        if (element.folder.id == folder.id) {
          element.isPull = false;
          element.pullStatus = null;
        }
        return element;
      }).toList();
      notifyListeners();
    }
  }
}