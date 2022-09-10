import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'foodlist.dart';
import 'globaldata.dart';
import 'main.dart';

class materialtab extends StatelessWidget {
  const materialtab({Key? key}) : super(key: key);

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
      title: 'materials',
      theme: ThemeData(fontFamily: 'main font'),
      home: materialtabPage(),
    );
  }
}

class materialtabPage extends StatefulWidget {
  const materialtabPage({Key? key}) : super(key: key);
  @override
  State<materialtabPage> createState() => _materialtabPageState();
}

class _materialtabPageState extends State<materialtabPage> {
  List<String> Matname = List.generate(70, (index) => '');
  List<String> objid = [
    '',
    '62cc5fa2ed5380ddf7e3193c',
    "62cc5fe3ed5380ddf7e3193f",
    "62cc5feded5380ddf7e31942",
    "62cc5ff4ed5380ddf7e31945",
    "62cc5ffbed5380ddf7e31948",
    "62cc6011ed5380ddf7e3194c",
    "62cc6019ed5380ddf7e3194f",
    "62cc6057ed5380ddf7e31955",
    "62cc6080ed5380ddf7e31958",
    "62cc609bed5380ddf7e3195b",
    "62cc60aaed5380ddf7e3195e",
    "62cc60c4ed5380ddf7e31961",
    "62cc60e3ed5380ddf7e31967",
    "62cc612bed5380ddf7e3196a",
    "62cc6147ed5380ddf7e3196d",
    "62cc614fed5380ddf7e31970",
    "62cc61c967b42cb1e41b7b0d",
    "62cc61d567b42cb1e41b7b10",
    "62cc61de67b42cb1e41b7b13",
    "62cc61e567b42cb1e41b7b16",
    "62cc61fa67b42cb1e41b7b19",
    "62cc620a67b42cb1e41b7b1c",
    "62cc621f67b42cb1e41b7b1f",
    "62cc623067b42cb1e41b7b22",
    "62cc624467b42cb1e41b7b25",
    "62cc625c67b42cb1e41b7b28",
    "62cc626867b42cb1e41b7b2b",
    "62cd6f4fb98309db24217042",
    "62cd6f59b98309db24217045",
    "62cd6f60b98309db24217048",
    "62cd6f68b98309db2421704b",
    "62cd6f6fb98309db2421704e",
    "62cd6f78b98309db24217051",
    "62cd6ffeb98309db24217058",
    "62cd701bb98309db2421705b",
    "62cd7022b98309db2421705e",
    "62cd7029b98309db24217061",
    "62cd702fb98309db24217064",
    "62cd7034b98309db24217067",
    "62cd703bb98309db2421706a",
    "62cd7045b98309db2421706d",
    "62cd704cb98309db24217070",
    "62cd70bab98309db24217076",
    "62cd70c4b98309db24217079",
    "62cd70edb98309db2421707c",
    "62cd70f4b98309db2421707f",
    "62cd70feb98309db24217082",
    "62cd7104b98309db24217085",
    "62cd710ab98309db24217088",
    "62cd7111b98309db2421708b",
    "62cd7117b98309db2421708e",
    "62cd7123b98309db24217091",
    "62cd7129b98309db24217094",
    "62cd7138b98309db24217097",
    '62cd7146b98309db2421709a',
    "62cd71a8b98309db2421709d",
    "62cd71b0b98309db242170a0",
    "62cd71bab98309db242170a3",
    "62cd71c1b98309db242170a6",
    "62cd71c7b98309db242170a9",
    "62cd71cfb98309db242170ac",
    "62cd71d6b98309db242170af",
    '"62cd71e4b98309db242170b2"',
    "62cd71f5b98309db242170b5",
    "62cd7202b98309db242170b8"
  ];
  List selectedobj = [];
  bool isclicked = false;
  List<bool> buttonlist = List.generate(67, (index) => false);
  var numclicked = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          for (var i = 1; i < objid.length; i++) {
            if (buttonlist[i] == true) {
              selectedobj.add(objid[i]);
            }
          }
          print(selectedobj);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => foodlist(selectedobj)),
          );
          GlobalData.foodlist_title = "غذا های پیشنهادی";
        },
        backgroundColor: Color(0xffeac11d),
        label: Text(
          ' جستجو ',
          style: TextStyle(fontSize: 20),
        ),
        icon: Icon(IconData(0xf013d, fontFamily: 'MaterialIcons')),
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
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 770,
                    margin: EdgeInsets.only(top: 20,right :10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[350],
                    ),
                    child: Column(children: [
                      Row(
                        children: [
                          Text(' سبزیجات ',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'font1',
                                fontSize: 45,
                                color: Colors.black,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text(' '),
                          materials(Matname[1] = ' هویج ', 1),
                          Text(' '),
                          materials(Matname[2] = ' پیاز ', 2),
                          Text(' '),
                          materials(Matname[3] = ' سیر ', 3),
                          Text(' '),
                          materials(Matname[4] = ' کاهو ', 4),
                          Text(' '),
                          materials(Matname[5] = ' گوجه ', 5),
                          Text(' '),
                          materials(Matname[6] = ' بادمجان ', 6),
                          Text(' '),
                          materials(Matname[7] = ' اسفناج ', 7),
                          Text(' '),
                          materials(Matname[8] = ' سیب زمینی ', 8),
                        ],
                      ),
                      Text(
                        '',
                        style: TextStyle(fontSize: 5),
                      ),
                      Row(children: [
                        Text(' '),
                        materials(Matname[9] = '  فلفل دلمه ای ', 9),
                        Text(' '),
                        materials(Matname[10] = 'نخود سبز', 10),
                        Text(' '),
                        materials(Matname[11] = 'سبزی خوردن', 11),
                        Text(' '),
                        materials(Matname[12] = 'سبزی آش', 12),
                        Text(' '),
                        materials(Matname[13] = 'سبزی قورمه', 13),
                        Text(' '),
                        materials(Matname[14] = 'سبزی پلویی', 14),
                      ]),
                      Text(
                        '',
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
                  ),
                  Container(
                    height: 190,
                    width: 770,
                    margin: EdgeInsets.only(top: 20,right :10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(' غلات ',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'font1',
                                fontSize: 45,
                                color: Colors.black,
                              ))
                        ]),
                        Row(
                          children: [
                            Text(' '),
                            materials(Matname[15] = 'برنج', 15),
                            Text(' '),
                            materials(Matname[16] = 'ذرت', 16),
                            Text(' '),
                            materials(Matname[17] = 'جو', 17),
                            Text(' '),
                            materials(Matname[18] = 'وانیل', 18),
                            Text(' '),
                            materials(Matname[19] = 'نان', 19),
                            Text(' '),
                            materials(Matname[20] = 'پاستا', 20),
                            Text(' '),
                            materials(Matname[21] = 'آرد سوخاری', 21),
                            Text(' '),
                            materials(Matname[22] = 'خمیر پیتزا', 22),
                            Text(' '),
                            materials(Matname[23] = ' ماکارونی ', 23),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 5),
                        ),
                        Row(
                          children: [
                            Text(' '),
                            materials(Matname[24] = ' نان باگت ', 24),
                            Text(' '),
                            materials(Matname[25] = ' آرد ذرت ', 25),
                            Text(' '),
                            materials(Matname[26] = ' آرد گندم ', 26),
                            Text(' '),
                            materials(Matname[27] = ' آرد برنج ', 27),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 770,
                    margin: EdgeInsets.only(top: 20,right :10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(' حبوبات ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'font1',
                                  fontSize: 45,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Text(' '),
                            materials(Matname[28] = ' عدس ', 28),
                            Text(' '),
                            materials(Matname[29] = ' لپه ', 29),
                            Text(' '),
                            materials(Matname[30] = ' لوبیا ', 30),
                            Text(' '),
                            materials(Matname[31] = ' ماش ', 31),
                            Text(' '),
                            materials(Matname[32] = ' نخود ', 32),
                            Text(' '),
                            materials(Matname[33] = ' باقلا ', 33),
                            Text(' '),
                            materials(Matname[34] = ' لوبیا چیتی ', 34),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 770,
                    margin: EdgeInsets.only(top: 20,right :10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(' لبنیات ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'font1',
                                  fontSize: 45,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Text(' '),
                            materials(Matname[35] = ' شیر ', 35),
                            Text(' '),
                            materials(Matname[36] = ' ماست ', 36),
                            Text(' '),
                            materials(Matname[37] = ' کره ', 37),
                            Text(' '),
                            materials(Matname[38] = ' کشک ', 38),
                            Text(' '),
                            materials(Matname[39] = ' پنیر ', 39),
                            Text(' '),
                            materials(Matname[40] = ' خامه ', 40),
                            Text(' '),
                            materials(Matname[41] = ' بستنی ', 41),
                            Text(' '),
                            materials(Matname[42] = 'دوغ', 42),
                            Text(' '),
                            materials(Matname[43] = ' پنیر پیتزا ', 43),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 5),
                        ),
                        Row(
                          children: [
                            Text(' '),
                            materials(Matname[44] = ' پنیر خامه ای ', 44),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 190,
                    width: 770,
                    margin: EdgeInsets.only(top: 20,right :10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[350],
                    ),
                    child: Column(children: [
                      Row(
                        children: [
                          Text(' میوه ها ',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'font1',
                                fontSize: 45,
                                color: Colors.black,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text(' '),
                          materials(Matname[45] = ' موز ', 45),
                          Text(' '),
                          materials(Matname[46] = 'انار', 46),
                          Text(' '),
                          materials(Matname[47] = 'آلبالو', 47),
                          Text(' '),
                          materials(Matname[48] = 'آلو', 48),
                          Text(' '),
                          materials(Matname[49] = 'به', 49),
                          Text(' '),
                          materials(Matname[50] = 'زرشک', 50),
                          Text(' '),
                          materials(Matname[51] = 'گردو', 51),
                          Text(' '),
                          materials(Matname[52] = 'خرما', 52),
                          Text(' '),
                          materials(Matname[53] = 'زیتون', 53),
                          Text(' '),
                          materials(Matname[54] = ' توت فرنگی ', 54),
                        ],
                      ),
                      Text(
                        '',
                        style: TextStyle(fontSize: 5),
                      ),
                      Row(
                        children: [
                          Text(' '),
                          materials(Matname[55] = ' لیمو ترش ', 55),
                        ],
                      )
                    ]),
                  ),
                  Container(
                    width: 770,
                    margin: EdgeInsets.only(top: 20,right :10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(' پروتئین ها ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'font1',
                                  fontSize: 45,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Text(' '),
                            materials(Matname[56] = ' مرغ ', 56),
                            Text(' '),
                            materials(Matname[57] = ' ماهی ', 57),
                            Text(' '),
                            materials(Matname[58] = ' بوقلمون ', 58),
                            Text(' '),
                            materials(Matname[59] = ' سوسیس ', 59),
                            Text(' '),
                            materials(Matname[60] = ' میگو ', 60),
                            Text(' '),
                            materials(Matname[61] = ' کالباس ', 61),
                            Text(' '),
                            materials(Matname[62] = 'همبرگر', 62),
                            Text(' '),
                            materials(Matname[63] = ' تخم مرغ ', 63),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 5),
                        ),
                        Row(
                          children: [
                            Text(' '),
                            materials(Matname[64] = ' گوشت قرمز ', 64),
                            Text(' '),
                            materials(Matname[65] = ' بال مرغ ', 65),
                            Text(' '),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                  )
                ],
              ),
              Container(
                width: 470,
                height: 1210,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey[350],
                ),
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 3.5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 3 / 2,
                  children: [
                    for (var i = 1; i <= 65; i++)
                      if (buttonlist[i] == true) ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              Matname[i],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                  ],
                ),
              ),
            ]),
          ))
        ],
      ),
    );
  }

  Widget materials(String name, int num) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () => setState(() {
          buttonlist[num] = !buttonlist[num];
          numclicked++;
        }),
        child: Text(
          name,
          style: TextStyle(fontSize: 16.5),
        ),
        style: ButtonStyle(
            backgroundColor: buttonlist[num]
                ? MaterialStateProperty.all<Color>(
                    Color(0xffeac11d),
                  )
                : MaterialStateProperty.all<Color>(
                    Color(0xff3B3B3B),
                  ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
      ),
    );
  }
}
