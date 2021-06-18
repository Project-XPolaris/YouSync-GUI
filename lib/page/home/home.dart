import 'package:flutter/material.dart';
import 'package:yousync/page/create/create.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sync"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateSyncDirectory()),
        );
      },child: Icon(Icons.add),),
    );
  }
}
