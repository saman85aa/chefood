import 'dart:convert';
import 'dart:html' as html;
import 'package:chefood/addfood.dart';
import 'package:chefood/food%20details.dart';
import 'package:chefood/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'globaldata.dart';

List<bool> isPressed =
    List.generate(GlobalData.cookable_food.length, (index) => false);

class foodlist extends StatelessWidget {
  List materials = [];
  foodlist(List materials) {
    this.materials = materials;
  }
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
      title: 'foods list',
      theme: ThemeData(fontFamily: 'main font'),
      home: foodlistPage(materials),
    );
  }
}

class foodlistPage extends StatefulWidget {
  List materials = [];
  foodlistPage(List materials) {
    this.materials = materials;
  }
  @override
  State<foodlistPage> createState() => _foodlistPageState(materials);
}

class _foodlistPageState extends State<foodlistPage> {
  List materials = [];
  _foodlistPageState(List materials) {
    this.materials = materials;
    sendmaterials();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (GlobalData.usertoken == '') {
              error('لطفا در ابتدا ورود کنید');
            } else if (GlobalData.usertoken != '') {
              getuserdata();
            }
          },
          backgroundColor: Color(0xffeac11d),
          label: Text(
            ' افزودن غذای جدید  ',
            style: TextStyle(fontSize: 25),
          ),
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 50.0,
            textDirection: TextDirection.ltr,
            semanticLabel: 'new food',
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Center(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/image.png') as ImageProvider),
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
                child: Column(children: [
                  Text(
                    GlobalData.foodlist_title,
                    style: TextStyle(fontSize: 40),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        childAspectRatio: 2 / 2.75),
                    itemCount: GlobalData.foodlist_title == "غذا های پیشنهادی"
                        ? GlobalData.cookable_food.length
                        : GlobalData.Responsebytag.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 490,
                              height: 400,
                              child: ElevatedButton(
                                onPressed: () {
                                  GlobalData.foodlist_title ==
                                          "غذا های پیشنهادی"
                                      ? GlobalData.selected_food_tag =
                                          GlobalData.cookable_food[index]['_id']
                                      : GlobalData.selected_food_tag =
                                          GlobalData.Responsebytag[index]
                                              ['_id'];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => food_details()),
                                  );
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff43a96f)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 390.0,
                                      height: 250.0,
                                      margin: EdgeInsets.only(top: 20),
                                      child: Image.network(GlobalData.foodlist_title ==
                                                  "غذا های پیشنهادی" &&
                                              (GlobalData.cookable_food[index]
                                                          ['imagelink'] !=
                                                      'http://154.91.170.55:8901undefined' &&
                                                  GlobalData.cookable_food[index]
                                                          ['imagelink'] !=
                                                      null)
                                          ? 'http://154.91.170.55:8901' +
                                              GlobalData.cookable_food[index]
                                                  ['imagelink']
                                          : GlobalData.foodlist_title != "غذا های پیشنهادی" &&
                                                  (GlobalData.Responsebytag[index]
                                                              ['imagelink'] !=
                                                          'http://154.91.170.55:8901undefined' &&
                                                      GlobalData.Responsebytag[index]['imagelink'] != null)
                                              ? GlobalData.Responsebytag[index]['imagelink']
                                              : 'data:image/png;base64,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'),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 20, top: 10),
                                          child: GlobalData.foodlist_title ==
                                                  "غذا های پیشنهادی"
                                              ? Text(
                                                  GlobalData
                                                          .cookable_food[index]
                                                      ['name'],
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Color(0xff3B3B3B)),
                                                )
                                              : Text(
                                                  GlobalData
                                                          .Responsebytag[index]
                                                      ['name'],
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Color(0xff3B3B3B)),
                                                ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Text('')
                ]),
              ),
            )
          ],
        ));
  }

  Future<void> sendmaterials() async {
    final Response = await http.post(
      Uri.parse('http://154.91.170.55:8901/api/search'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"materials": materials}),
    );
    setState(() {
      GlobalData.cookable_food = jsonDecode(Response.body);
    });
    print(Response.body);
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

  Future<void> getuserdata() async {
    final Response = await http.get(
      Uri.parse('http://154.91.170.55:8901/api/users/me'),
      headers: <String, String>{
        'x-auth-token': GlobalData.usertoken.toString()
      },
    );
    isadmin = jsonDecode(Response.body)['isAdmin'];
    print(jsonDecode(Response.body)['isAdmin']);
    if (isadmin == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => addfood()),
      );
    } else {
      error('شما دسترسی به این بخش را ندارید');
    }
  }

  bool isadmin = false;
}
