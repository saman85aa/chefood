import 'dart:html';
import 'package:chefood/globaldata.dart';
import 'package:chefood/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chefood/changepass.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);
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
      title: 'profile',
      theme: ThemeData(fontFamily: 'main font'),
      home: profilePage(),
    );
  }
}

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);
  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final double coverHeight = 400;
  final double profileHeight = 144;
  Map responsed = {};
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    getuserdata();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
          SliverToBoxAdapter(
              child: Container(
            color: Color(0xff43a96f),
            child: Column(
              children: [
                buildTop(),
                Text(
                  responsed['name'] == null ? "" : responsed['name'],
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                'ایمیل :',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                responsed['email'] == null
                                    ? ""
                                    : responsed['email'],
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 200,
                          margin: EdgeInsets.only(right: 0, top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => changepassworld()),
                              );
                            },
                            child: Text(
                              'تغییر رمز عبور',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xffeac11d),
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                          ),
                        ),
                        Container(
                          height: 50,
                        )
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(right: 20),
                        //       child: Text(
                        //         'رمز عبور :',
                        //         style: TextStyle(fontSize: 25),
                        //       ),
                        //     ),
                        //     Container(
                        //       margin: EdgeInsets.only(right: 20),
                        //       child: Text(
                        //         responsed[''],
                        //         style: TextStyle(fontSize: 25),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage()),
          Positioned(
            top: top,
            child: buildProfileImage(),
          )
        ]);
  }

  Widget buildCoverImage() => Container(
      width: double.infinity,
      height: coverHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/image9.jpeg",
              ),
              fit: BoxFit.fill)));
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundImage: AssetImage("assets/image8.png"),
      );
  Future<void> getuserdata() async {
    final Response = await http.get(
      Uri.parse('http://154.91.170.55:8901/api/users/me'),
      headers: <String, String>{
        'x-auth-token': GlobalData.usertoken.toString()
      },
    );
    setState(() {
      responsed = jsonDecode(Response.body);
    });
    print(responsed);
  }
}
