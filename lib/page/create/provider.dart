import 'package:flutter/material.dart';
import 'package:yousync/api/base_response.dart';
import 'package:yousync/api/client.dart';
import 'package:yousync/api/sync_folder.dart';
import 'package:yousync/database/database.dart';
import 'package:yousync/database/helper.dart';
import 'package:yousync/database/sync_folder.dao.dart';
import 'package:yousync/database/sync_folder.dart';

class CreateProvider extends ChangeNotifier {
  CreateProvider({initRemotePath}){
    remotePath = initRemotePath;
  }
  int MAX_STEP = 2;
  int step = 0;
  String? localPath;
  String? remotePath;
  nextStep(){
    if (step == MAX_STEP) {
      return;
    }
    step += 1;
    notifyListeners();
  }
  prevStep(){
    if (step == 0) {
      return;
    }
    step -= 1;
    notifyListeners();
  }
  setLocalPath(String? path){
    localPath = path;
    notifyListeners();
  }
  setRemotePath(String? path){
    remotePath = path;
    notifyListeners();
  }
  createSync()async{
    var createPath  = remotePath;
    if (createPath == null) {
      return;
    }
    var createLocalPath = localPath;
    if (createLocalPath == null){
      return;
    }
    final SyncFolderResponse response = await ApiClient().createSyncFolder(createPath);
    AppDatabase appDatabase = await DatabaseHelper().getDatabase();
    var createRemoteId = response.id;
    if (createRemoteId == null) {
      return;
    }
    appDatabase.syncFolderDao.insertSyncFolder(new SyncFolder(null, createLocalPath, createRemoteId));
  }
}