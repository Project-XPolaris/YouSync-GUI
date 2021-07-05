import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/components/local-dir-select.dart';
import 'package:yousync/components/remote-dir-select.dart';
import 'package:yousync/layout/title.dart';
import 'package:yousync/page/create/provider.dart';

class CreateSyncDirectory extends StatefulWidget {
  final String? initRemotePath;
  const CreateSyncDirectory({Key? key,this.initRemotePath}) : super(key: key);

  @override
  _CreateSyncDirectoryState createState() => _CreateSyncDirectoryState();
}

class _CreateSyncDirectoryState extends State<CreateSyncDirectory> {
  @override
  Widget build(BuildContext context) {
    return TitleBar(
      child: ChangeNotifierProvider<CreateProvider>(
          create: (_) => CreateProvider(initRemotePath: widget.initRemotePath),
          child: Consumer<CreateProvider>(builder: (context, provider, child) {
            _getOnFinish(){
              if (provider.remotePath == null || provider.localPath == null) {
                return null;
              }
              return () async {
                await provider.createSync();
                Navigator.of(context).pop();
              };
            }
            return Scaffold(
              appBar: AppBar(
                title: Text("Create sync"),
              ),
              body: Container(
               child: ListView(
                 children: [
                   ListTile(
                     title: Text(provider.localPath ?? "not select"),
                     leading: Icon(Icons.folder),
                     subtitle: Text("Local sync folder"),
                     onTap: (){
                       showModalBottomSheet(context: context, builder: (BuildContext ctx) {
                         return LocalDirectoryPicker(onPick: (path) {
                           provider.setLocalPath(path);
                         },initPath: provider.localPath,);
                       });
                     },
                   ),
                   ListTile(
                     title: Text(provider.remotePath ?? "not select"),
                     leading: Icon(Icons.cloud),
                     subtitle: Text("Remote sync folder"),
                     onTap: (){
                       showModalBottomSheet(context: context, builder: (BuildContext ctx) {
                         return RemoteDirectoryPicker(onPick: (path) {
                           provider.setRemotePath(path);
                         },initPath: provider.remotePath,);
                       });
                     },
                   )
                 ],
               ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: _getOnFinish(),
                label: Text('Create'),
                backgroundColor: _getOnFinish() == null ? Colors.grey : Colors.yellow,
                icon: Icon(Icons.check),
              ),
            );
          })),
    );
  }
}
