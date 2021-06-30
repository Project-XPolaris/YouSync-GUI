import 'package:flutter/material.dart';
import 'package:yousync/config.dart';

class UserBottomSheet extends StatefulWidget {
  final Function() onReconnect;
  const UserBottomSheet({Key? key,required this.onReconnect }) : super(key: key);
  @override
  _UserBottomSheetState createState() => _UserBottomSheetState();
}

class _UserBottomSheetState extends State<UserBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Color(0x00FFFFFF),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              constraints: BoxConstraints(maxWidth: 480),
              child: Column(
                children: [
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text("My"),
                    ),
                    padding: EdgeInsets.all(16),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Container(
                      child: ListTile(
                        title: Text(ApplicationConfig().serviceUrl ?? ""),
                        subtitle: Text("Sync host"),
                      ),
                      padding: EdgeInsets.only(left: 16, right: 16)),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.of(context).pop();
                          widget.onReconnect();
                        }, child: Text("Reconnect"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
