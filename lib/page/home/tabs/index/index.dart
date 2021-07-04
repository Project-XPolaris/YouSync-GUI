import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/components/sync-card.dart';
import 'package:yousync/config.dart';
import 'package:yousync/page/create/create.dart';
import 'package:yousync/page/detail/detail.dart';
import 'package:yousync/page/home/tabs/index/provider.dart';
import 'package:yousync/page/home/user-bottom-sheet.dart';
import 'package:yousync/page/home/user-button.dart';
import 'package:yousync/service/client.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

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
                UserButton()
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
                      onPull: () {
                        provider.pull(e.folder);
                      },
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                folder: e.folder,
                                onUpdate: () {
                                  provider.refresh(force: true);
                                },
                              )),
                        );
                      },
                      item: e);
                }).toList(),
              ),
            ),
          );
        }));
  }
}
