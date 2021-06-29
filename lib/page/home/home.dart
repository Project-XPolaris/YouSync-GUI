import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/components/sync-card.dart';
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
              onRefresh: () async {
                provider.refresh(force: true);
              },
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: provider.folders.map((e) {
                  return SyncCard(
                      onSync: () {
                        provider.sync(e.folder);
                      },
                      onRemove: () {
                        provider.removeSyncFolder(e.folder);
                      },
                      onPull: (){
                        provider.pull(e.folder);
                      },
                      item: e);
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
