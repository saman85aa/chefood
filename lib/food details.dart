import 'package:chefood/globaldata.dart';
import 'package:chefood/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'dart:convert';

double gainrate = 10;
List Matname = [
  {"matname": 'هویج', "id": "62cc5fa2ed5380ddf7e3193c"},
  {"matname": 'پیاز', "id": "62cc5fe3ed5380ddf7e3193f"},
  {"matname": 'سیر', "id": "62cc5feded5380ddf7e31942"},
  {"matname": 'کاهو', "id": "62cc5ff4ed5380ddf7e31945"},
  {"matname": 'گوجه', "id": "62cc5ffbed5380ddf7e31948"},
  {"matname": 'بادمجان', "id": "62cc6011ed5380ddf7e3194c"},
  {"matname": 'اسفناج', "id": "62cc6019ed5380ddf7e3194f"},
  {"matname": 'سیب زمینی', "id": "62cc6057ed5380ddf7e31955"},
  {"matname": 'فلفل دلمه ای', "id": "62cc6080ed5380ddf7e31958"},
  {"matname": 'نخود سبز', "id": "62cc609bed5380ddf7e3195b"},
  {"matname": 'سبزی خوردن', "id": "62cc60aaed5380ddf7e3195e"},
  {"matname": 'سبزی آش', "id": "62cc60c4ed5380ddf7e31961"},
  {"matname": 'سبزی قورمه', "id": "62cc60e3ed5380ddf7e31967"},
  {"matname": 'سبزی پلویی', "id": "62cc612bed5380ddf7e3196a"},
  {"matname": 'برنج', "id": "62cc6147ed5380ddf7e3196d"},
  {"matname": 'ذرت', "id": "62cc614fed5380ddf7e31970"},
  {"matname": 'جو', "id": "62cc61c967b42cb1e41b7b0d"},
  {"matname": 'وانیل', "id": "62cc61d567b42cb1e41b7b10"},
  {"matname": 'نان', "id": "62cc61de67b42cb1e41b7b13"},
  {"matname": 'پاستا', "id": "62cc61e567b42cb1e41b7b16"},
  {"matname": 'آرد سوخاری', "id": "62cc61fa67b42cb1e41b7b19"},
  {"matname": 'خمیر پیتزا', "id": "62cc620a67b42cb1e41b7b1c"},
  {"matname": 'ماکارونی', "id": "62cc621f67b42cb1e41b7b1f"},
  {"matname": 'نان باگت', "id": "62cc623067b42cb1e41b7b22"},
  {"matname": 'آرد ذرت', "id": "62cc624467b42cb1e41b7b25"},
  {"matname": 'آرد گندم', "id": "62cc625c67b42cb1e41b7b28"},
  {"matname": 'آرد برنج', "id": "62cc626867b42cb1e41b7b2b"},
  {"matname": 'عدس', "id": "62cd6f4fb98309db24217042"},
  {"matname": 'لپه', "id": "62cd6f59b98309db24217045"},
  {"matname": 'لوبیا', "id": "62cd6f60b98309db24217048"},
  {"matname": 'ماش', "id": "62cd6f68b98309db2421704b"},
  {"matname": 'نخود', "id": "62cd6f6fb98309db2421704e"},
  {"matname": 'باقلا', "id": "62cd6f78b98309db24217051"},
  {"matname": 'لوبیا چیتی', "id": "62cd6ffeb98309db24217058"},
  {"matname": 'شیر', "id": "62cd701bb98309db2421705b"},
  {"matname": 'ماست', "id": "62cd7022b98309db2421705e"},
  {"matname": 'کره', "id": "62cd7029b98309db24217061"},
  {"matname": 'کشک', "id": "62cd702fb98309db24217064"},
  {"matname": 'پنیر', "id": "62cd7034b98309db24217067"},
  {"matname": 'خامه', "id": "62cd703bb98309db2421706a"},
  {"matname": 'بستنی', "id": "62cd7045b98309db2421706d"},
  {"matname": 'دوغ', "id": "62cd704cb98309db24217070"},
  {"matname": 'پنیر پیتزا', "id": "62cd70bab98309db24217076"},
  {"matname": 'پنیر خامه ای', "id": "62cd70c4b98309db24217079"},
  {"matname": 'موز', "id": "62cd70edb98309db2421707c"},
  {"matname": 'انار', "id": "62cd70f4b98309db2421707f"},
  {"matname": 'آلبالو', "id": "62cd70feb98309db24217082"},
  {"matname": 'آلو', "id": "62cd7104b98309db24217085"},
  {"matname": 'به', "id": "62cd710ab98309db24217088"},
  {"matname": 'زرشک', "id": "62cd7111b98309db2421708b"},
  {"matname": 'گردو', "id": "62cd7117b98309db2421708e"},
  {"matname": 'خرما', "id": "62cd7123b98309db24217091"},
  {"matname": 'زیتون', "id": "62cd7129b98309db24217094"},
  {"matname": 'توت فرنگی', "id": "62cd7138b98309db24217097"},
  {"matname": 'لیمو ترش', "id": "62cd7146b98309db2421709a"},
  {"matname": 'مرغ', "id": "62cd71a8b98309db2421709d"},
  {"matname": 'ماهی', "id": "62cd71b0b98309db242170a0"},
  {"matname": 'بوقلمون', "id": "62cd71bab98309db242170a3"},
  {"matname": 'سوسیس', "id": "62cd71c1b98309db242170a6"},
  {"matname": 'میگو', "id": "62cd71c7b98309db242170a9"},
  {"matname": 'کالباس', "id": "62cd71cfb98309db242170ac"},
  {"matname": 'همبرگر', "id": "62cd71d6b98309db242170af"},
  {"matname": 'تخم مرغ', "id": "62cd71e4b98309db242170b2"},
  {"matname": 'گوشت قرمز', "id": "62cd71f5b98309db242170b5"},
  {"matname": 'بال مرغ', "id": "62cd7202b98309db242170b8"},
];

class food_details extends StatelessWidget {
  const food_details({Key? key}) : super(key: key);

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
      title: 'food details',
      theme: ThemeData(fontFamily: 'main font'),
      home: food_detailsPage(),
    );
  }
}

class food_detailsPage extends StatefulWidget {
  const food_detailsPage({Key? key}) : super(key: key);
  @override
  State<food_detailsPage> createState() => _food_detailsPageState();
}

class _food_detailsPageState extends State<food_detailsPage> {
  @override
  Widget build(BuildContext context) {
    getfoodbyid();
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.white, Colors.grey.shade400]),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 10, left: 15),
                      width: 600,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff43a96f).withOpacity(.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                GlobalData.selected_food_tag_body[0]['name'],
                                style: TextStyle(fontSize: 35),
                              ),
                              Text(''),
                              Row(children: [
                                items(
                                    ' زمان مورد نیاز ',
                                    GlobalData.selected_food_tag_body[0]['time']
                                            .toString() +
                                        " دقیقه",
                                    230,
                                    110,
                                    0),
                                items(
                                    ' مناسب برای ',
                                    GlobalData.selected_food_tag_body[0]
                                                ['enoughfor']
                                            .toString() +
                                        " نفر",
                                    230,
                                    110,
                                    3),
                              ]),
                              Text(''),
                              Row(
                                children: [
                                  items(
                                      " نیاز به فر ",
                                      GlobalData.selected_food_tag_body[0]
                                                  ['needoven'] ==
                                              false
                                          ? "ندارد"
                                          : "دارد",
                                      230,
                                      110,
                                      2),
                                  items(
                                      ' کالری ',
                                      GlobalData.selected_food_tag_body[0]
                                                  ['calorie']
                                              .toString() +
                                          " کالری",
                                      230,
                                      110,
                                      5),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 15),
                      child: ImageSlideshow(
                          width: 600,
                          height: 350,
                          initialPage: 0,
                          indicatorColor: Colors.blue,
                          indicatorBackgroundColor: Colors.grey,
                          children: [
                            GestureDetector(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(GlobalData
                                                  .selected_food_tag_body[0]
                                              ['imagelink']),
                                          fit: BoxFit.fill))),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  html.window.open(
                                      GlobalData.selected_food_tag_body[0]
                                          ['link'],
                                      '');
                                },
                                child: Text('ویدیو آموزش پخت این غذا'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color(0xff43a96f).withOpacity(.4),
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )),
                                )),
                          ]),
                    )
                  ],
                ),
                Text(''),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 100 / 20),
                  itemCount:
                      GlobalData.selected_food_tag_body[0]['materials'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xffeac11d),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                          child: Text(
                        GlobalData.selected_food_tag_body[0]['materials']
                            [index],
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      )),
                    );
                  },
                ),
                Text(''),
                Container(
                  width: 1250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xff43a96f).withOpacity(.4)),
                  child: Center(
                      child: RichText(
                          text: TextSpan(
                              text: GlobalData.selected_food_tag_body[0]
                                  ['recipe'],
                              style: TextStyle(fontSize: 25)))),
                ),
                Text(''),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       ' به این غذا نمره بدهید : ',
                //       style: TextStyle(fontSize: 40),
                //     ),
                //     RatingBar.builder(
                //       minRating: 0,
                //       direction: Axis.horizontal,
                //       allowHalfRating: false,
                //       itemCount: 5,
                //       itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                //       itemBuilder: (context, indexx) => Icon(
                //         Icons.star,
                //         color: Colors.amber,
                //       ),
                //       onRatingUpdate: (rating) {
                //         gainrate = rating;
                //       },
                //     ),
                //   ],
                // ),
                Text(
                  '',
                  style: TextStyle(fontSize: 40),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget items(
    String parametr,
    String status,
    double widthsize,
    double heightsize,
    double marginR,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xff43a96f),
      ),
      child: Column(
        children: [
          Text(
            parametr,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          Text("______________________"),
          Text(
            status,
            style: TextStyle(fontSize: 22, color: Colors.white),
          )
        ],
      ),
      width: widthsize,
      height: heightsize,
      padding: EdgeInsets.only(right: marginR, top: 5),
      margin: EdgeInsets.only(right: 45),
    );
  }

  Future<void> getfoodbyid() async {
    final response = await http.get(
      Uri.parse('http://154.91.170.55:8901/api/foods/' +
          GlobalData.selected_food_tag),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    setState(() {
      GlobalData.selected_food_tag_body[0] = jsonDecode(response.body);
    });
    for (var i = 0;
        i <= GlobalData.selected_food_tag_body[0]['materials'].length;
        i++) {
      for (var j = 0; j <= Matname.length; j++) {
        if (GlobalData.selected_food_tag_body[0]['materials'][i] ==
            Matname[j]['id']) {
          setState(() {
            GlobalData.selected_food_tag_body[0]['materials'][i] =
                Matname[j]['matname'];
          });
          break;
        }
      }
    }
  }
}
