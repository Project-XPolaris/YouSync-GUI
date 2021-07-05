import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/components/sync-card.dart';
import 'package:yousync/config.dart';
import 'package:yousync/layout/title.dart';
import 'package:yousync/page/create/create.dart';
import 'package:yousync/page/detail/detail.dart';
import 'package:yousync/page/home/tabs/index/index.dart';
import 'package:yousync/page/home/tabs/index/provider.dart';
import 'package:yousync/page/home/tabs/remote/index.dart';
import 'package:yousync/page/home/user-bottom-sheet.dart';
import 'package:yousync/service/client.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return TitleBar(
      child: ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
          child: Consumer<HomeProvider>(builder: (context, provider, child) {
            provider.refresh();
            return Scaffold(
              backgroundColor: Colors.white,
              body: IndexedStack(
                index: tabIndex,
                children: [
                  IndexPage(),
                  RemoteListPage()
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabIndex,
                onTap: (index){
                  setState(() {
                    tabIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.folder),label: "Local"),
                  BottomNavigationBarItem(icon: Icon(Icons.cloud),label: "Remote")
                ],
              ),
            );
          })),
    );
  }
}
