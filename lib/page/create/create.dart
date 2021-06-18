import 'package:flutter/material.dart';
import 'package:yousync/page/create/step/local/local.dart';
import 'package:yousync/page/create/step/remote/remote.dart';

class CreateSyncDirectory extends StatefulWidget {
  const CreateSyncDirectory({Key? key}) : super(key: key);

  @override
  _CreateSyncDirectoryState createState() => _CreateSyncDirectoryState();
}

class _CreateSyncDirectoryState extends State<CreateSyncDirectory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create sync"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: IndexedStack(
              children: [
                SelectLocalDirectory(),
                SelectRemoteDirectory()
              ],
            )),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){}, child: Text("Previous")),
                  TextButton(onPressed: (){}, child: Text("Next"))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
