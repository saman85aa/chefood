import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'main.dart';
import 'package:chefood/globaldata.dart';
import 'package:http/http.dart' as http;

class changepassworld extends StatelessWidget {
  const changepassworld({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR"),
      title: 'change passworld',
      theme: ThemeData(fontFamily: 'main font'),
      home: const changepassworldPage(title: 'change passworld'),
    );
  }
}

class changepassworldPage extends StatefulWidget {
  const changepassworldPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<changepassworldPage> createState() => _changepassworldPageState();
}

class _changepassworldPageState extends State<changepassworldPage> {
  TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image.png') as ImageProvider),
              ),
              width: 300,
              height: 80,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Main()),
              );
            },
          ),
        ),
        backgroundColor: Color(0xff3B3B3B),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff43a96f)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300]),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20, top: 10),
                        child: Text(
                          'تغییر رمز عبور',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(children: [
                        Container(
                          child: Text(
                            '   رمز عبور جدید  ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 25),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 20, left: 10),
                            width: 400,
                            height: 60,
                            child: TextField(
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              cursorWidth: (3),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              controller: _passwordController,
                            )),
                      ]),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 500,
                        height: 65.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff3B3B3B))),
                          child: Text('تغییر رمز عبور',
                              style: TextStyle(
                                  fontSize: 40, color: Color(0xffeac11d))),
                          onPressed: () {
                            if (_passwordController.text.isEmpty) {
                              error("فیلد خالی میباشد");
                            } else {
                              editpass();
                            }
                          },
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ]),
      ),
    );
  }

  Future error(errortype) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(errortype),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Text("بستن"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  Future<void> editpass() async {
    final Response = await http.put(
      Uri.parse('http://154.91.170.55:8901/api/users/me'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': GlobalData.usertoken.toString()
      },
      body: jsonEncode(<String, String>{"password": _passwordController.text}),
    );
    if (Response.statusCode == 200) {
      error('تغییرات با موفقیت صورت گرفت');
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Main()),
        );
      });
    } else if (Response.body ==
        '"password" length must be at least 5 characters long') {
      error('رمز عبور باید حداقل 5 کارکتر باشد');
    }
  }
}
