import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yousync/api/service_info_response.dart';
import 'package:yousync/config.dart';
import 'package:yousync/page/home/home.dart';
import 'package:yousync/service/client.dart';
import 'package:yousync/utils/login_history.dart';

class StartPage extends StatefulWidget {
  const StartPage() : super();

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String inputUrl = "";
  String inputUsername = "";
  String inputPassword = "";
  String loginMode = "history";

  Future<bool> _init() async {
    await LoginHistoryManager().refreshHistory();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    _onFinishClick() async {
      String requestUrl = "http://$inputUrl:4300/info";
      Dio dio = new Dio();
      var response = await dio.get(requestUrl);
      ServiceInfoResponse info = ServiceInfoResponse.fromJson(response.data);
      if (!info.success) {
        return;
      }
      LoginHistoryManager().add(LoginHistory(apiUrl: inputUrl, username: "Public", token: ""));
      ApplicationConfig().serviceUrl = inputUrl;
      DefaultSyncClient.connect(inputUrl);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    _onHistoryClick(LoginHistory history) async {
      var config = ApplicationConfig();
      Dio dio = new Dio();
      String requestUrl = "http://${history.apiUrl}:4300/info";
      try {
        var response = await dio.get(requestUrl);
        ServiceInfoResponse info = ServiceInfoResponse.fromJson(response.data);
        if (!info.success) {
          return;
        }
      } on DioError catch(e) {
        return;
      }
      config.serviceUrl = history.apiUrl;
      DefaultSyncClient.connect(history.apiUrl);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onFinishClick();
        },
        child: Icon(Icons.chevron_right),
      ),
      body: FutureBuilder(
          future: _init(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(),
                        child: Text(
                          "YouSync",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 48,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 64),
                        child: Text(
                          "from ProjectXPolaris",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ),
                      Expanded(
                          child: DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 240,
                              margin: EdgeInsets.only(bottom: 16),
                              child: TabBar(
                                indicatorColor: Colors.blue,
                                tabs: [
                                  Tab(
                                    text: "History",
                                  ),
                                  Tab(
                                    text: "New login",
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: TabBarView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                ListView(
                                  children:
                                      LoginHistoryManager().list.map((history) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      child: ListTile(
                                        onTap: () {
                                          _onHistoryClick(history);
                                        },
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: Text(history.username),
                                        subtitle: Text(history.apiUrl),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                ListView(
                                  children: [
                                    TextField(
                                      cursorColor: Colors.blue,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                          hintText: 'Service URL'),
                                      onChanged: (text) {
                                        setState(() {
                                          inputUrl = text;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ))
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
