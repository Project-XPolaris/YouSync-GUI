import 'package:flutter/material.dart';
import 'package:yousync/api/client.dart';
import 'package:yousync/database/database.dart';
import 'package:yousync/database/helper.dart';
import 'package:yousync/database/sync_folder.dart';
import 'package:yousync/service/client.dart';

class SyncFolderItem {
  SyncFolder folder;
  bool isSync;
  bool isPull;

  SyncFolderItem(this.folder, {this.isSync = false, this.isPull = false});

  SyncFolderStatus? syncStatus;
  PullFolderStatus? pullStatus;
}

class HomeProvider extends ChangeNotifier {
  List<SyncFolderItem> folders = [];
  bool first = true;
  List<int> SyncFolderId = [];

  refresh({force = false}) async {
    if (!first && !force) {
      return;
    }
    first = false;
    AppDatabase appDatabase = await DatabaseHelper().getDatabase();
    var rawFolders = await appDatabase.syncFolderDao.findAllSyncFolders();
    folders = rawFolders.map((element) {
     var items = folders.where((exist) => exist.folder.id == element.id);
     if (items.isEmpty) {
       return SyncFolderItem(element);
     }
     var syncFolder = SyncFolderItem(element);
     syncFolder.isSync = items.first.isSync;
     syncFolder.syncStatus = items.first.syncStatus;
     syncFolder.isPull = items.first.isPull;
     syncFolder.pullStatus = items.first.pullStatus;
     return syncFolder;
    }).toList();
    notifyListeners();
  }

  removeSyncFolder(SyncFolder folder) async {
    AppDatabase appDatabase = await DatabaseHelper().getDatabase();
    await appDatabase.syncFolderDao.deleteSyncFolder(folder);
    var id = folder.id;
    if (id != null) {
      await ApiClient().removeSyncFolder(id);
    }
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
      await DefaultSyncClient.syncFolder(folder.localPath, folder.remoteId,
          onRefresh: (status) {
        folders.forEach((element) {
          if (element.folder.id == folder.id) {
            element.syncStatus = status;
          }
        });
        notifyListeners();
      });
      if (folder.syncFileList) {
        await DefaultSyncClient.syncFileList(folder.localPath, folder.remoteId);
      }
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

  pull(SyncFolder folder) async {
    folders = folders.map((element) {
      if (element.folder.id == folder.id) {
        element.isPull = true;
      }
      return element;
    }).toList();
    notifyListeners();
    try {
      await DefaultSyncClient.pull(folder.localPath, folder.remoteId,
          onUpdate: (status) {
        folders.forEach((element) {
          if (element.folder.id == folder.id) {
            element.pullStatus = status;
          }
        });
        notifyListeners();
      });
    } finally {
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
