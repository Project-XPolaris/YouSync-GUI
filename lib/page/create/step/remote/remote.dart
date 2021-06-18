import 'package:flutter/material.dart';

class SelectRemoteDirectory extends StatefulWidget {
  const SelectRemoteDirectory({Key? key}) : super(key: key);

  @override
  _SelectRemoteDirectory createState() => _SelectRemoteDirectory();
}

class _SelectRemoteDirectory extends State<SelectRemoteDirectory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Select remote directory",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ))
        ],
      ),
    );
  }
}
