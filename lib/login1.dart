import 'dart:convert';
import 'dart:html';
import 'package:chefood/globaldata.dart';
import 'package:chefood/main.dart';
import 'package:chefood/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

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
      title: 'login',
      theme: ThemeData(fontFamily: 'main font'),
      home: loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _forgetpasswordController = new TextEditingController();
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
                        'ورود',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('        '),
                      SizedBox(
                        width: 450,
                        height: 60,
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
                                  borderSide: BorderSide(color: Colors.black))),
                          controller: _emailController,
                        ),
                      ),
                      Text('                      '),
                      SizedBox(
                        width: 450,
                        height: 60,
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
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
                              hintText: ('  رمز عبور   '),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.black))),
                          controller: _passwordController,
                        ),
                      ),
                      Text('                      '),
                      SizedBox(
                        width: 450,
                        height: 70.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff43a96f))),
                          child: Text('ورود',
                              style: TextStyle(
                                fontSize: 40,
                              )),
                          onPressed: () {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              errors("لطفا تمامی فیلد ها را پر کنید");
                            } else {
                              sendLoginRequest();
                            }
                          },
                        ),
                      ),
                      Text(''),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 225,
                              height: 70.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff3B3B3B))),
                                child: Text(' ثبت نام ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Color(0xffeac11d))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signup()),
                                  );
                                },
                              ),
                            ),
                            Container(width: 10),
                            SizedBox(
                              width: 225,
                              height: 70.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff3B3B3B))),
                                child: Text(' فراموشی رمز عبور ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Color(0xffeac11d))),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          scrollable: true,
                                          title: Text(' تغییر رمز عبور '),
                                          content: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 200),
                                                  child: Text(
                                                      "ایمیل خود را وارد کنید"),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 350,
                                                  child: TextField(
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                    ),
                                                    cursorWidth: (3),
                                                    decoration: InputDecoration(
                                                        fillColor:
                                                            Colors.grey[200],
                                                        filled: true,
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        15,
                                                                    horizontal:
                                                                        10),
                                                        hintText: (' ایمیل '),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                    controller:
                                                        _forgetpasswordController,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
                                                child: Text("بازیابی رمز عبور"),
                                                onPressed: () {
                                                  forgetpassworld();
                                                  Navigator.pop(context);
                                                  if (_forgetpasswordController
                                                      .text.isEmpty) {
                                                    errors(
                                                        'لطفا ایمیل خود را وارد کنید');
                                                  }
                                                })
                                          ],
                                        );
                                      });
                                },
                              ),
                            ),
                          ])
                    ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Future errors(String errorsname) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(errorsname),
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
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  void sendLoginRequest() async {
    final response = await http.post(
      Uri.parse('http://154.91.170.55:8901/api/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": _emailController.text,
        "password": _passwordController.text
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      errors('ورود با موفقیت انجام شد');
      GlobalData.usertoken = (response.body);
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Main()),
        );
      });
    } else {
      errors('رمز عبور یا ایمیل اشتباه است');
    }
  }

  void forgetpassworld() async {
    final responseforget = await http.post(
      Uri.parse('http://154.91.170.55:8901/api/resetpassword/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": _forgetpasswordController.text,
      }),
    );
    print(responseforget.statusCode);
    print(responseforget.body);
    if (responseforget.body == '"email" must be a valid email') {
      errors('ایمیل صحیح وارد نشده');
    }
    else if(responseforget.body=='user with given email doesn\'t exist')
    {
      errors('شما قبلا ثبت نام نکرده اید');
    }
    else if(responseforget.body == 'password reset link sent to your email account')
    {
      errors('ایمیل برای شما ارسال شد');
    }
  }
}
