import 'package:flutter/material.dart';
import 'package:yousync/page/home/provider.dart';
import 'package:path/path.dart';

class SyncCard extends StatelessWidget {
  final Function() onRemove;
  final Function() onSync;
  final Function() onPull;
  final SyncFolderItem item;
  const SyncCard({Key? key,required this.onSync,required this.onRemove,required this.item,required this.onPull}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _renderStatus(){
      var status = item.status;
      if (status == null) {
        return Container();
      }
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16,bottom: 4),
              padding: EdgeInsets.only(left: 16,right: 16),
              child: Text(status.file.path),
            ),
            Container(
              padding: EdgeInsets.only(left: 16,right: 16),
              child: LinearProgressIndicator(value: status.file.chunk / status.file.totalChunk,),
            )
          ],
        ),
      );
    }
    _getIcon(){
      if (item.isSync) {
        return Icons.sync;
      }
      if (item.isPull) {
        return Icons.download_rounded;
      }
      return Icons.folder;
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(_getIcon(),color: Colors.white,),
            ),
            title: Text(basename(item.folder.localPath)),
            subtitle: Text(item.folder.localPath),
            trailing: PopupMenuButton(
              onSelected: (value){
                if (value == "remove") {
                  onRemove();
                }
                if (value == "sync") {
                  onSync();
                }
                if (value == "pull") {
                  onPull();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "sync",
                  child: Text('Sync'),
                ),
                const PopupMenuItem<String>(
                  value: "pull",
                  child: Text('Pull'),
                ),
                const PopupMenuItem<String>(
                  value: "remove",
                  child: Text('Remove'),
                ),
              ],
            ),
          ),
          _renderStatus()
        ],
      ),
    );
  }
}
