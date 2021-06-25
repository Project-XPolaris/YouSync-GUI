import 'package:floor/floor.dart';

@entity
class SyncFolder {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String localPath;
  final int remoteId;

  SyncFolder(this.id, this.localPath,this.remoteId);
}