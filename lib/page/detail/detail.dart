import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/components/local-dir-select.dart';
import 'package:yousync/database/sync_folder.dart';
import 'package:path/path.dart' as p;
import 'package:yousync/page/detail/provider.dart';

class DetailPage extends StatefulWidget {
  final SyncFolder folder;
  final Function? onUpdate;

  const DetailPage({Key? key, required this.folder, this.onUpdate})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
        create: (_) => DetailProvider(widget.folder),
        child: Consumer<DetailProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(p.basename(provider.folder.localPath)),
            ),
            body: ListView(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      "Info",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w700),
                    )),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text(provider.folder.localPath),
                  subtitle: Text("local path"),
                  onTap: (){
                    showModalBottomSheet(context: context, builder: (BuildContext ctx) {
                      return LocalDirectoryPicker(onPick: (path){
                        provider.changeLocalPath(path);
                        widget.onUpdate?.call();
                      },);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.cloud_download),
                  title: Text(provider.folder.remoteId.toString()),
                  subtitle: Text("remote path"),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      "Sync",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w700),
                    )),
                ListTile(
                  leading: Icon(Icons.sync),
                  title:
                      Text("Full sync"),
                  subtitle: Text(
                      "remove if remote exist but not local,remove file or directory"),
                  trailing: Switch(
                    value: provider.folder.syncFileList,
                    activeColor: Colors.blue,
                    onChanged: (checked) {
                      provider.changeSyncFileList(checked);
                      widget.onUpdate?.call();
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
