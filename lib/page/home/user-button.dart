import 'package:flutter/material.dart';
import 'package:yousync/page/home/user-bottom-sheet.dart';
import 'package:yousync/service/client.dart';

import '../../config.dart';

class UserButton extends StatefulWidget {
  const UserButton({Key? key}) : super(key: key);

  @override
  _UserButtonState createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 16),
      child: GestureDetector(
        child: CircleAvatar(
          backgroundColor: Colors.blue.shade800,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return UserBottomSheet(
                  onReconnect: () {
                    var url = ApplicationConfig().serviceUrl;
                    if (url != null) {
                      DefaultSyncClient.connect(url);
                    }
                  },
                );
              },
              backgroundColor: Colors.transparent);
        },
      ),
    );
  }
}
