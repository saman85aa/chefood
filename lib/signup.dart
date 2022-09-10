import 'dart:convert';
import 'dart:html';
import 'package:chefood/globaldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

void main() {
  runApp(const signup());
}

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

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
      title: 'signup',
      theme: ThemeData(fontFamily: 'main font'),
      home: signupPage(),
    );
  }
}

class signupPage extends StatefulWidget {
  const signupPage({Key? key}) : super(key: key);
  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  bool passworldchecker = true;
  bool emptychecker = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmpasswordController =
      new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.all(25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ثبت نام',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('        '),
                      SizedBox(
                          width: 450,
                          height: 50,
                          child: TextField(
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
                                hintText: ('  ایمیل '),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            controller: _emailController,
                          )),
                      Text(
                        "",
                      ),
                      SizedBox(
                          width: 450,
                          height: 50,
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
                                hintText: ('  نام کاربری   '),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            controller: _nameController,
                          )),
                      Text(
                        "  ",
                      ),
                      SizedBox(
                          width: 450,
                          height: 50,
                          child: TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
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
                                hintText: (' رمز عبور '),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            controller: _passwordController,
                          )),
                      Text('           '),
                      SizedBox(
                          width: 450,
                          height: 50,
                          child: TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
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
                                hintText: (' تکرار رمز عبور   '),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            controller: _confirmpasswordController,
                          )),
                      Text(''),
                      SizedBox(
                        width: 450,
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
                          child: Text('ثبت نام',
                              style: TextStyle(
                                  fontSize: 40, color: Color(0xffeac11d))),
                          onPressed: () {
                            if (_emailController.text.isEmpty ||
                                _confirmpasswordController.text.isEmpty ||
                                _passwordController.text.isEmpty ||
                                _nameController.text.isEmpty) {
                              signuperror("لطفا تمامی فیلد ها را پر کنید");
                            } else if (_passwordController.text !=
                                _confirmpasswordController.text) {
                              signuperror("رمز عبور و تکرار آن یکسان نیست");
                            } else {
                              sendsignuprequest();
                            }
                          },
                        ),
                      ),
                    ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Future signuperror(errortype) {
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

  Future<void> sendsignuprequest() async {
    final Response = await http.post(
      Uri.parse('http://154.91.170.55:8901/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": _nameController.text,
        "email": _emailController.text,
        "password": _passwordController.text
      }),
    );
    if (Response.body == 'User already registered.') {
      signuperror('شما قبلا ثبت نام کرده اید');
    } else if (Response.body == '"email" must be a valid email') {
      signuperror('لطفا ایمیل خود را صحیح وارد کنید');
    } else if (Response.body ==
        '"password" length must be at least 5 characters long') {
      signuperror('رمز عبور باید حداقل 5 کارکتر باشد');
    } else if (Response.statusCode == 200) {
      signuperror("ثبت نام با موفقیت انجام شد");
      GlobalData.usertoken = Response.body;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Main()),
      );
    }
  }
}
