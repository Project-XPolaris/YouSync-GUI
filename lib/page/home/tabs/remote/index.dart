import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/components/remote-dir-select.dart';
import 'package:yousync/page/create/create.dart';
import 'package:yousync/page/home/tabs/remote/provider.dart';

import '../../user-button.dart';

class RemoteListPage extends StatefulWidget {
  const RemoteListPage({Key? key}) : super(key: key);

  @override
  _RemoteListPageState createState() => _RemoteListPageState();
}

class _RemoteListPageState extends State<RemoteListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RemoteListProvider>(
        create: (_) => RemoteListProvider(),
    child: Consumer<RemoteListProvider>(builder: (context, provider, child) {
      provider.refresh();
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Remote folders"),
          actions: [
            UserButton()
          ],
        ),
        body: Container(
          child: RefreshIndicator(
            onRefresh: ()async {
              await provider.refresh();
              },
            child: ListView(
              children: provider.remoteFolders.map((folder) {
                return ListTile(
                  leading: CircleAvatar(child: Icon(Icons.folder),),
                  title: Text(folder.name ?? ""),
                  subtitle: Text(folder.path ?? ""),
                  trailing: PopupMenuButton(
                    onSelected: (value)async {
                      if (value == "remove") {
                        await provider.removeFolder(folder.id!);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("remove success")));
                      }
                      if (value == "link") {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => CreateSyncDirectory(initRemotePath: folder.path,)));
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: "remove",
                        child: Text('Remove'),
                      ),
                      const PopupMenuItem<String>(
                        value: "link",
                        child: Text('link with local'),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(context: context, builder: (BuildContext ctx) {
              return RemoteDirectoryPicker(onPick: (path)async {
                await provider.addFonder(path);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("create success")));

              });
            });
          },
          child: Icon(Icons.add,color: Colors.white,),
        ),
      );
    }));

  }
}
