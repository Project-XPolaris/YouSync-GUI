import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/page/create/create.dart';
import 'package:yousync/page/home/provider.dart';
import 'package:path/path.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
        child: Consumer<HomeProvider>(builder: (context, provider, child) {
          provider.refresh();
          return Scaffold(
            appBar: AppBar(
              title: Text("Sync"),
            ),
            body: RefreshIndicator(
              onRefresh: ()async {
                provider.refresh(force:true);
              },
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: provider.folders.map((e) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(e.isSync?Icons.sync:Icons.folder,color: Colors.white,),
                    ),
                    title: Text(basename(e.folder.localPath)),
                    subtitle: Text(e.folder.localPath),
                    trailing: PopupMenuButton(
                      onSelected: (value){
                        if (value == "remove") {
                          provider.removeSyncFolder(e.folder);
                        }
                        if (value == "sync") {
                          provider.sync(e.folder);
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: "sync",
                          child: Text('Sync'),
                        ),
                        const PopupMenuItem<String>(
                          value: "remove",
                          child: Text('Remove'),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateSyncDirectory()),
                );
              },
              child: Icon(Icons.add),
            ),
          );
        }));
  }
}
