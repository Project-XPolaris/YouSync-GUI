import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:yousync/page/create/provider.dart';

class SelectLocalDirectory extends StatefulWidget {
  final CreateProvider createProvider;

  const SelectLocalDirectory({Key? key, required this.createProvider})
      : super(key: key);

  @override
  _SelectLocalDirectoryState createState() => _SelectLocalDirectoryState();
}

class DirectoryItem {
  final String path;
  final String name;

  DirectoryItem({required this.path, required this.name});
}

class _SelectLocalDirectoryState extends State<SelectLocalDirectory> {
  List<DirectoryItem> _dirItems = [];
  String pathInput = "";
  String backPath = "";
  var _inputPathController = TextEditingController();

  _refreshPathItem(String readPath) async {
    _inputPathController.text = readPath;
    var dir = Directory(readPath);

    var items = dir.listSync().where((element) => element.statSync().type == FileSystemEntityType.directory);
    setState(() {
      _dirItems = items
          .map((e) => DirectoryItem(path: e.path, name: basename(e.path)))
          .toList();
      pathInput = readPath;
      backPath = dir.parent.path;
    });
  }

  _init() async {
    var initDir = await getApplicationDocumentsDirectory();
    if (Platform.isAndroid){
      initDir = new Directory("/storage/emulated/0");
    }
    setState(() {
      pathInput = initDir.path;
    });
    _refreshPathItem(initDir.path);
  }

  @override
  void initState() {
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              child: Text(
                "Select local directory",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22),
              )),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  onChanged: (text) {
                    setState(() {
                      print(text);
                      pathInput = text;
                    });
                  },
                  controller: _inputPathController,
                )),
                TextButton(
                    onPressed: () {
                      _refreshPathItem(pathInput);
                    },
                    child: Text("GO"))
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                title: Text("Go back"),
                leading: Icon(Icons.arrow_left),
                onTap: (){
                  _refreshPathItem(backPath);
                },
              ),
              ..._dirItems.map((item) {
                return ListTile(
                  title: Text(item.name),
                  leading: CircleAvatar(
                    child: Icon(Icons.folder),
                  ),
                  onTap: () {
                    _refreshPathItem(item.path);
                  },
                  trailing: GestureDetector(
                    child: Icon(
                      Icons.check,
                      color: widget.createProvider.localPath == item.path
                          ? Colors.blue
                          : null,
                    ),
                    onTap: () {
                      widget.createProvider.setLocalPath(item.path);
                    },
                  ),
                );
              }).toList()
            ],
          ))
        ],
      ),
    );
  }
}
