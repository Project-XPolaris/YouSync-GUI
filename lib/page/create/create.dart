import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yousync/page/create/provider.dart';
import 'package:yousync/page/create/step/confirm/comfirm.dart';
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
    return ChangeNotifierProvider<CreateProvider>(
        create: (_) => CreateProvider(),
        child: Consumer<CreateProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Create sync"),
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: IndexedStack(
                    index: provider.step,
                    children: [
                      SelectLocalDirectory(
                        createProvider: provider,
                      ),
                      SelectRemoteDirectory(
                        createProvider: provider,
                      ),
                      ConfirmStep(
                        provider: provider,
                      )
                    ],
                  )),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: provider.step != 0 ?() {
                              provider.prevStep();
                            }:null,

                            child: Text("Previous")),
                        TextButton(
                            onPressed: () {
                              if (provider.step == 2) {
                                provider.createSync();
                                Navigator.of(context).pop();
                                return;
                              }
                              provider.nextStep();
                            },
                            child: Text(provider.step != 2 ? "Next" : "Finish"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
