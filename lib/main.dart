import 'dart:convert';
import 'package:chefood/addfood.dart';
import 'package:chefood/food%20details.dart';
import 'package:chefood/globaldata.dart';
import 'package:http/http.dart' as http;
import 'package:chefood/foodlist.dart';
import 'package:chefood/login1.dart';
import 'package:chefood/material.dart';
import 'package:chefood/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chefood/globaldata.dart';

void main() => runApp(Main());
String tag = "";
List empty = [];

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
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
      title: 'chefood',
      home: MainPage(),
      theme: ThemeData(fontFamily: 'main font'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3B3B3B),
          centerTitle: true,
          title: Image.asset(
            'assets/image.png',
            width: 300,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              color: GlobalData.usertoken == ''
                  ? Color(0xffeac11d)
                  : Color(0xff43a96f),
              onPressed: () {
                if (GlobalData.usertoken == "") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('لطفا در ابتدا ورود کنید'),
                          actions: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
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
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile()),
                  );
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.login),
              color: GlobalData.usertoken == ""
                  ? Color(0xffeac11d)
                  : Color(0xff43a96f),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                color: Color(0xff3B3B3B),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ImageSlideshow(
                      autoPlayInterval: 5000,
                      isLoop: true,
                      width: 1200,
                      height: 460,
                      initialPage: 0,
                      indicatorColor: Colors.blue,
                      indicatorBackgroundColor: Colors.grey,
                      children: [
                        GestureDetector(
                          child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/image6.png",
                                      ),
                                      fit: BoxFit.fill))),
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/image3.png",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => materialtab()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image7.png')
                                    as ImageProvider),
                          ),
                          width: 400,
                          height: 400,
                        ),
                        onTap: () {
                          tag = "مجلسی";
                          getfoodsbytag();
                          GlobalData.foodlist_title = "مجلسی";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => foodlist(empty)),
                          );
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image4.png')
                                    as ImageProvider),
                          ),
                          width: 400,
                          height: 400,
                        ),
                        onTap: () {
                          tag = "فست فود";
                          getfoodsbytag();
                          GlobalData.foodlist_title = "فست فود";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => foodlist(empty)),
                          );
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image11.png')
                                    as ImageProvider),
                          ),
                          width: 400,
                          height: 400,
                        ),
                        onTap: () {
                          tag = "حاضری";
                          getfoodsbytag();
                          GlobalData.foodlist_title = "حاضری";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => foodlist(empty)),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image3.png')
                                      as ImageProvider),
                              borderRadius: BorderRadius.circular(30)),
                          width: 500,
                          height: 300,
                          margin: EdgeInsets.only(right: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => materialtab()),
                          );
                        },
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffeac11d)),
                          height: 270,
                          width: 700,
                          margin: EdgeInsets.only(right: 40),
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 280,
                                      height: 250,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (responselist[0]['_id'] == '') {
                                          } else {
                                            GlobalData.selected_food_tag =
                                                responselist[0]['_id'];
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      food_details()),
                                            );
                                          }
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color(0xff43a96f)),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 330.0,
                                              height: 170.0,
                                              margin: EdgeInsets.only(top: 20),
                                              child: Image.network(
                                                responselist[0]['imagelink'] ==
                                                            '' ||
                                                        responselist[0]
                                                                ['imagelink'] ==
                                                            'http://154.91.170.55:8901undefined'
                                                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo8pUIDNBGPPp2AFgyOHMXMjKqPRTTfIjoTZ_nB6m7f7-sfmMjXzexfTdV2995GlW3SDA&usqp=CAU'
                                                    : responselist[0]
                                                        ['imagelink'],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 20, top: 20),
                                                    child: Text(
                                                      responselist[0]['name'],
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ))
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Text(
                                    'پیشنهاد تصادفی',
                                    style: TextStyle(fontSize: 35),
                                  ),
                                  margin: EdgeInsets.only(right: 110, top: 30),
                                ),
                                Container(
                                  height: 70,
                                  width: 250,
                                  margin: EdgeInsets.only(right: 100, top: 30),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        randomfood();
                                      },
                                      child: Text(
                                        responselist[0]['name'] != ''
                                            ? 'پیشنهاد بعدی'
                                            : 'پیدا کردن یک غذای تصافی',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color(0xff43a96f),
                                        ),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        )),
                                      )),
                                )
                              ],
                            )
                          ]))
                    ],
                  )
                ]))));
  }

  Future<void> randomfood() async {
    final Response = await http.get(
      Uri.parse('http://154.91.170.55:8901/api/foods/random'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    setState(() {
      fresponse = jsonDecode(Response.body);
      responselist[0]['name'] = fresponse[0]['name'];
      responselist[0]['imagelink'] = fresponse[0]['imagelink'];
      responselist[0]['_id'] = fresponse[0]['_id'];
    });
  }

  Future<void> getfoodsbytag() async {
    final Responsebytagl = await http.get(
      Uri.parse('http://154.91.170.55:8901/api/foods/tag/' + tag),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    GlobalData.Responsebytag = jsonDecode(Responsebytagl.body);
  }

  List responselist = [
    {
      "_id": "",
      "name": "",
      "imagelink": "",
    }
  ];
}

var fresponse;
