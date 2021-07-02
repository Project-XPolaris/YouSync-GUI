import 'package:flutter/material.dart';
import 'package:yousync/page/home/provider.dart';
import 'package:path/path.dart';

class SyncCard extends StatelessWidget {
  final Function() onRemove;
  final Function() onSync;
  final Function() onPull;
  final Function() onClick;
  final SyncFolderItem item;
  const SyncCard({Key? key,required this.onSync,required this.onRemove,required this.item,required this.onPull,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _renderStatus(){
      var syncStatus = item.syncStatus;
      if (syncStatus != null) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16,bottom: 4),
                padding: EdgeInsets.only(left: 16,right: 16),
                child: Text(syncStatus.file.path),
              ),
              Container(
                padding: EdgeInsets.only(left: 16,right: 16),
                child: LinearProgressIndicator(value: syncStatus.file.chunk / syncStatus.file.totalChunk,),
              )
            ],
          ),
        );
      }
      var pullStatus = item.pullStatus;
      if (pullStatus != null) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16,bottom: 4),
                padding: EdgeInsets.only(left: 16,right: 16),
                child: Text(pullStatus.file.path),
              ),
              Container(
                padding: EdgeInsets.only(left: 16,right: 16),
                child: LinearProgressIndicator(value: pullStatus.file.chunk / pullStatus.file.totalChunk,),
              )
            ],
          ),
        );
      }
      return Container();
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
    _renderMenu(){
      if (item.isSync || item.isPull) {
        return null;
      }
      return PopupMenuButton(
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
      );
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: onClick,
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(_getIcon(),color: Colors.white,),
            ),
            title: Text(basename(item.folder.localPath)),
            subtitle: Text(item.folder.localPath),
            trailing: _renderMenu(),
          ),
          _renderStatus()
        ],
      ),
    );
  }
}
