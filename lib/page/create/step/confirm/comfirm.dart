import 'package:flutter/material.dart';
import 'package:yousync/page/create/provider.dart';

class ConfirmStep extends StatelessWidget {
  final CreateProvider provider;

  const ConfirmStep({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Local sync path",
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                provider.localPath ?? "",
                style: TextStyle(color: Colors.black87, fontSize: 16),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Remote sync path",
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                provider.remotePath ?? "",
                style: TextStyle(color: Colors.black87, fontSize: 16),
              )
            ],
          ),
        )
      ]),
    );
  }
}
