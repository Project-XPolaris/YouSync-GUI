import 'package:flutter/material.dart';
import 'package:yousync/api/client.dart';
import 'package:yousync/api/sync_folders_list_response.dart';

class RemoteListProvider extends ChangeNotifier {
  bool isFirst = true;
  List<RemoteSyncFolder> remoteFolders = [];
  refresh({force = false}) async {
    if (!isFirst && !force) {
      return;
    }
    isFirst = false;
    var response = await ApiClient().remoteSyncFolderList();
    remoteFolders = response.result!;
    notifyListeners();
  }
  addFonder(String path) async {
    await ApiClient().createSyncFolder(path);
    await refresh(force: true);
  }
  removeFolder(int id)async{
    await ApiClient().removeSyncFolder(id);
    await refresh(force: true);
  }
}