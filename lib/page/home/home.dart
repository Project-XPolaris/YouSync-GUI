import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/components/sync-card.dart';
import 'package:yousync/config.dart';
import 'package:yousync/page/create/create.dart';
import 'package:yousync/page/home/provider.dart';
import 'package:path/path.dart';
import 'package:yousync/page/home/user-bottom-sheet.dart';
import 'package:yousync/service/client.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
        child: Consumer<HomeProvider>(builder: (context, provider, child) {
          provider.refresh();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Sync"),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.shade800,
                      child: Icon(Icons.person,color: Colors.white,),
                    ),
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (BuildContext context) {
                        return UserBottomSheet(
                          onReconnect: (){
                            var url = ApplicationConfig().serviceUrl;
                            if (url != null) {
                              DefaultSyncClient.connect(url);
                            }
                          },
                        );
                      },backgroundColor: Colors.transparent);
                    },
                  ),
                )
              ],
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
