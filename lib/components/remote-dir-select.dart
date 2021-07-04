import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:yousync/api/client.dart';
import 'package:yousync/api/read_dir_response.dart';

class RemoteDirectoryPicker extends StatefulWidget {
  final Function onPick;
  final String? initPath;
  const RemoteDirectoryPicker({Key? key,required this.onPick,this.initPath}) : super(key: key);

  @override
  _RemoteDirectoryPickerState createState() => _RemoteDirectoryPickerState();
}

class DirectoryItem {
  final String path;
  final String name;

  DirectoryItem({required this.path, required this.name});
}

class _RemoteDirectoryPickerState extends State<RemoteDirectoryPicker> {
  List<DirectoryItem> _dirItems = [];
  String pathInput = "";
  String? backPath = "";
  var _inputPathController = TextEditingController();


  _refreshPathItem(String readPath) async {
    ReadDirResponse readDirResponse = await ApiClient().readRemoteDir(readPath);
    _inputPathController.text = readPath;
    setState(() {
      _dirItems = (readDirResponse.files ?? []).where((element) => element.type == "Directory").map((e) => DirectoryItem(path: e.path ?? "", name: e.name ?? "")).toList()
          .map((e) => DirectoryItem(path: e.path, name: basename(e.path)))
          .toList();
      backPath = readDirResponse.back;
      pathInput = readPath;
    });
  }

  _init() async {
    setState(() {
      pathInput = "/";
    });
    _refreshPathItem("/");
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
                      if (backPath != null) {
                        _refreshPathItem(backPath!);
                      }
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
