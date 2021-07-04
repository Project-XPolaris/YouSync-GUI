import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yousync/api/client.dart';
import 'package:yousync/api/service_info_response.dart';
import 'package:yousync/api/user_auth.dart';
import 'package:yousync/api/user_token.dart';
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
      ApplicationConfig().serviceUrl = inputUrl;
      try {
        ServiceInfoResponse info =  await ApiClient().fetchServiceInfo();
        if (!info.success) {
          return;
        }
        if (info.auth) {
          if (inputUsername.isEmpty || inputPassword.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Service need auth")));
            return;
          }
          UserAuth userAuth = await ApiClient().userAuth(inputUsername, inputPassword);
          LoginHistoryManager().add(LoginHistory(apiUrl: inputUrl, username: inputUsername, token: userAuth.token));
          ApplicationConfig().token = userAuth.token;
          ApplicationConfig().username = inputUsername;
        }else{
          LoginHistoryManager().add(LoginHistory(apiUrl: inputUrl, username: "Public", token: ""));
        }

      } on DioError catch(e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed: ${e.response?.data["reason"]}")));
        return;
      }
      DefaultSyncClient.connect(inputUrl);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    _onHistoryClick(LoginHistory history) async {
      ApplicationConfig().serviceUrl = history.apiUrl;
      try {
        ServiceInfoResponse info =  await ApiClient().fetchServiceInfo();
        if (!info.success) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to connect host")));
          return;
        }
        if (info.auth) {
          if (history.token.length == 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("token is empty,try to login again")));
            return;
          }
          UserToken token = await ApiClient().userToken(history.token);
          if (!token.success){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("token is empty,try to login again")));
            return;
          }
          ApplicationConfig().token = history.token;
          ApplicationConfig().username = history.username;
        }

      } on DioError catch(e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed: ${e.response?.data["reason"]}")));
        return;
      }
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
        child: Icon(Icons.chevron_right,color: Colors.white,),
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
                                labelColor: Colors.black87,
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
                                          hintText: 'Service URL'),
                                      onChanged: (text) {
                                        setState(() {
                                          inputUrl = text;
                                        });
                                      },
                                    ),
                                    TextField(
                                      cursorColor: Colors.blue,
                                      decoration: InputDecoration(
                                          hintText: 'username'),
                                      onChanged: (text) {
                                        setState(() {
                                          inputUsername = text;
                                        });
                                      },
                                    ),
                                    TextField(
                                      cursorColor: Colors.blue,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: 'password'),
                                      onChanged: (text) {
                                        setState(() {
                                          inputPassword = text;
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
