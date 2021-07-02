import 'package:floor/floor.dart';

@entity
class SyncFolder {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String localPath;
  int remoteId;

  bool syncFileList;

  SyncFolder(this.id, this.localPath,this.remoteId,{this.syncFileList = false});
}