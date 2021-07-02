import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class LocalDirectoryPicker extends StatefulWidget {
  final Function onPick;
  const LocalDirectoryPicker({Key? key,required this.onPick}) : super(key: key);

  @override
  _LocalDirectoryPickerState createState() => _LocalDirectoryPickerState();
}

class DirectoryItem {
  final String path;
  final String name;

  DirectoryItem({required this.path, required this.name});
}

class _LocalDirectoryPickerState extends State<LocalDirectoryPicker> {
  List<DirectoryItem> _dirItems = [];
  String pathInput = "";
  String backPath = "";
  var _inputPathController = TextEditingController();

  _refreshPathItem(String readPath) async {
    _inputPathController.text = readPath;
    var dir = Directory(readPath);

    var items = dir.listSync().where(
        (element) => element.statSync().type == FileSystemEntityType.directory);
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
    if (Platform.isAndroid) {
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
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      _refreshPathItem(backPath);
                    },
                    icon: Icon(Icons.arrow_back)),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: TextField(
                          decoration:
                              new InputDecoration.collapsed(hintText: 'path'),
                          onChanged: (text) {
                            setState(() {
                              print(text);
                              pathInput = text;
                            });
                          },
                          controller: _inputPathController,
                        ))),
                TextButton(
                    onPressed: () {
                      _refreshPathItem(pathInput);
                    },
                    child: Text("Go"))
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: _dirItems.map((e) {
              return ListTile(
                leading: Icon(Icons.folder),
                title: Text(e.name),
                onTap: () {
                  _refreshPathItem(e.path);
                },
              );
            }).toList(),
          )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              child: Text("Select"),
              onPressed: () {
                Navigator.of(context).pop();
                widget.onPick(pathInput);
              },
            ),
          )
        ],
      ),
    );
  }
}
