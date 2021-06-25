
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:yousync/api/client.dart';
import 'package:yousync/api/read_dir_response.dart';

import '../../provider.dart';

class SelectRemoteDirectory extends StatefulWidget {
  final CreateProvider createProvider;
  const SelectRemoteDirectory({Key? key,required this.createProvider}) : super(key: key);

  @override
  _SelectRemoteDirectoryState createState() => _SelectRemoteDirectoryState();
}

class DirectoryItem {
  final String path;
  final String name;

  DirectoryItem({required this.path, required this.name});
}

class _SelectRemoteDirectoryState extends State<SelectRemoteDirectory> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding:
              EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              child: Text(
                "Select remote directory",
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
                      if (backPath != null) {
                        _refreshPathItem(backPath!);
                      }
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
                          color: widget.createProvider.remotePath == item.path
                              ? Colors.blue
                              : null,
                        ),
                        onTap: () {
                          widget.createProvider.setRemotePath(item.path);
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
