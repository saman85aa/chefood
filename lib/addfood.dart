import 'dart:convert';
import 'dart:html';
import 'package:chefood/globaldata.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'main.dart';

class addfood extends StatelessWidget {
  const addfood({Key? key}) : super(key: key);

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
      title: 'add food',
      theme: ThemeData(fontFamily: 'main font'),
      home: addfoodPage(),
    );
  }
}

class addfoodPage extends StatefulWidget {
  const addfoodPage({Key? key}) : super(key: key);
  @override
  State<addfoodPage> createState() => _addfoodPageState();
}

class _addfoodPageState extends State<addfoodPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _recipeController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _calorieController = TextEditingController();
  TextEditingController _enoughforController = TextEditingController();

  List selectedmat = [];
  String tag = "";
  void Upload() async {
    if (tags[0] == true) {
      tag = "مجلسی";
    } else if (tags[1] == true) {
      tag = "حاضری";
    } else if (tags[2] == true) {
      tag = "فست فود";
    }
    final response = await http.post(
      Uri.parse('http://154.91.170.55:8901/api/foods'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token' : GlobalData.usertoken,
      },
      body: jsonEncode({
        "name": _nameController.text,
        "tag": tag,
        "time": _timeController.text,
        "enoughfor": _calorieController.text,
        "materials": selectedmat,
        "link": _linkController.text,
        "calorie": _calorieController.text,
        "recipe": _recipeController.text,
        "needoven": needoven.toString()
      }),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 400 || response.statusCode == 500) {
      selectedmat.clear();
    }
  }
  // Future<void> Upload() async {
  //   print("gav1");
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('http://154.91.170.55:8901/api/foods'));
  //   request.headers.addAll({
  //     "x-auth-token":
  //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmM2N2I3ZTVmMjE2NjFjOTM0YWY4ODciLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE2NjEwODkwNjYsImV4cCI6MTY2MjgxNzA2Nn0.0yzAjQiDI20Xjhrf3KRlEIFf9vCL2IjM7lB4lKNobyE"
  //   });
  //   request.files.add(http.MultipartFile.fromBytes(
  //       'imagelink', File(pic.path).readAsBytesSync()));
  //   request.fields['name'] = 'name';
  //   var res = await request.send();
  //   final respStr = await res.stream.bytesToString();
  //   print(res.statusCode);
  //   print(respStr);
  // }
  List Matname = [
    {
      "matname": 'هویج',
      "id": "62cc5fa2ed5380ddf7e3193c",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'پیاز',
      "id": "62cc5fe3ed5380ddf7e3193f",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'سیر',
      "id": "62cc5feded5380ddf7e31942",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'کاهو',
      "id": "62cc5ff4ed5380ddf7e31945",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'گوجه',
      "id": "62cc5ffbed5380ddf7e31948",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'بادمجان',
      "id": "62cc6011ed5380ddf7e3194c",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'اسفناج',
      "id": "62cc6019ed5380ddf7e3194f",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'سیب زمینی',
      "id": "62cc6057ed5380ddf7e31955",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'فلفل دلمه ای',
      "id": "62cc6080ed5380ddf7e31958",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'نخود سبز',
      "id": "62cc609bed5380ddf7e3195b",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'سبزی خوردن',
      "id": "62cc60aaed5380ddf7e3195e",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'سبزی آش',
      "id": "62cc60c4ed5380ddf7e31961",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'سبزی قورمه',
      "id": "62cc60e3ed5380ddf7e31967",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'سبزی پلویی',
      "id": "62cc612bed5380ddf7e3196a",
      "tag": "سبزیجات",
      "pressed": false
    },
    {
      "matname": 'برنج',
      "id": "62cc6147ed5380ddf7e3196d",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'ذرت',
      "id": "62cc614fed5380ddf7e31970",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'جو',
      "id": "62cc61c967b42cb1e41b7b0d",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'وانیل',
      "id": "62cc61d567b42cb1e41b7b10",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'نان',
      "id": "62cc61de67b42cb1e41b7b13",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'پاستا',
      "id": "62cc61e567b42cb1e41b7b16",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'آرد سوخاری',
      "id": "62cc61fa67b42cb1e41b7b19",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'خمیر پیتزا',
      "id": "62cc620a67b42cb1e41b7b1c",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'ماکارونی',
      "id": "62cc621f67b42cb1e41b7b1f",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'نان باگت',
      "id": "62cc623067b42cb1e41b7b22",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'آرد ذرت',
      "id": "62cc624467b42cb1e41b7b25",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'آرد گندم',
      "id": "62cc625c67b42cb1e41b7b28",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'آرد برنج',
      "id": "62cc626867b42cb1e41b7b2b",
      "tag": "غلات",
      "pressed": false
    },
    {
      "matname": 'عدس',
      "id": "62cd6f4fb98309db24217042",
      "tag": "حبوبات",
      "pressed": false
    },
    {
      "matname": 'لپه',
      "id": "62cd6f59b98309db24217045",
      "tag": "حبوبات",
      "pressed": false
    },
    {
      "matname": 'لوبیا',
      "id": "62cd6f60b98309db24217048",
      "tag": "حبوبات",
      "pressed": false
    },
    {
      "matname": 'ماش',
      "id": "62cd6f68b98309db2421704b",
      "tag": "حبوبات",
      "pressed": false
    },
    {
      "matname": 'نخود',
      "id": "62cd6f6fb98309db2421704e",
      "tag": "حبوبات",
      "pressed": false
    },
    {
      "matname": 'باقلا',
      "id": "62cd6f78b98309db24217051",
      "tag": "حبوبات",
      "pressed": false
    },
    {
      "matname": 'لوبیا چیتی',
      "id": "62cd6ffeb98309db24217058",
      "tag": "حبوبات",
      "pressed": false
    },
    {
      "matname": 'شیر',
      "id": "62cd701bb98309db2421705b",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'ماست',
      "id": "62cd7022b98309db2421705e",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'کره',
      "id": "62cd7029b98309db24217061",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'کشک',
      "id": "62cd702fb98309db24217064",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'پنیر',
      "id": "62cd7034b98309db24217067",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'خامه',
      "id": "62cd703bb98309db2421706a",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'بستنی',
      "id": "62cd7045b98309db2421706d",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'دوغ',
      "id": "62cd704cb98309db24217070",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'پنیر پیتزا',
      "id": "62cd70bab98309db24217076",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'پنیر خامه ای',
      "id": "62cd70c4b98309db24217079",
      "tag": "لبنیات",
      "pressed": false
    },
    {
      "matname": 'موز',
      "id": "62cd70edb98309db2421707c",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'انار',
      "id": "62cd70f4b98309db2421707f",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'آلبالو',
      "id": "62cd70feb98309db24217082",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'آلو',
      "id": "62cd7104b98309db24217085",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'به',
      "id": "62cd710ab98309db24217088",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'زرشک',
      "id": "62cd7111b98309db2421708b",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'گردو',
      "id": "62cd7117b98309db2421708e",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'خرما',
      "id": "62cd7123b98309db24217091",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'زیتون',
      "id": "62cd7129b98309db24217094",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'توت فرنگی',
      "id": "62cd7138b98309db24217097",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'لیمو ترش',
      "id": "62cd7146b98309db2421709a",
      "tag": "میوه ها",
      "pressed": false
    },
    {
      "matname": 'مرغ',
      "id": "62cd71a8b98309db2421709d",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'ماهی',
      "id": "62cd71b0b98309db242170a0",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'بوقلمون',
      "id": "62cd71bab98309db242170a3",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'سوسیس',
      "id": "62cd71c1b98309db242170a6",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'میگو',
      "id": "62cd71c7b98309db242170a9",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'کالباس',
      "id": "62cd71cfb98309db242170ac",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'همبرگر',
      "id": "62cd71d6b98309db242170af",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'تخم مرغ',
      "id": "62cd71e4b98309db242170b2",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'گوشت قرمز',
      "id": "62cd71f5b98309db242170b5",
      "tag": "پروتئین ها",
      "pressed": false
    },
    {
      "matname": 'بال مرغ',
      "id": "62cd7202b98309db242170b8",
      "tag": "پروتئین ها",
      "pressed": false
    },
  ];
  List<bool> tags = [false, false, false];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool needoven = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                child: Column(
          children: [
            Row(children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child:
                            Text('نام غذا :', style: TextStyle(fontSize: 30)),
                        margin: EdgeInsets.only(right: 20, top: 5),
                      ),
                      Container(
                          width: 320,
                          height: 50,
                          margin: EdgeInsets.only(right: 50, top: 5),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            cursorWidth: (3),
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: _nameController,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('نیاز به فر :',
                            style: TextStyle(fontSize: 30)),
                        margin: EdgeInsets.only(top: 20),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 20),
                        width: 50,
                        height: 50,
                        child: Checkbox(
                          value: needoven,
                          onChanged: (value) {
                            setState(() {
                              needoven = value!;
                              print(needoven.toString());
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child:
                            Text('زمان طبخ :', style: TextStyle(fontSize: 30)),
                        margin: EdgeInsets.only(right: 20, top: 20),
                      ),
                      Container(
                          width: 295,
                          height: 50,
                          margin: EdgeInsets.only(right: 40, top: 20),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            cursorWidth: (3),
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: _timeController,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('کالری :', style: TextStyle(fontSize: 30)),
                        margin: EdgeInsets.only(right: 20, top: 20),
                      ),
                      Container(
                          width: 295,
                          height: 50,
                          margin: EdgeInsets.only(right: 90, top: 20),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            cursorWidth: (3),
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: _calorieController,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('لینک ویدیو :',
                            style: TextStyle(fontSize: 30)),
                        margin: EdgeInsets.only(right: 20, top: 20),
                      ),
                      Container(
                          width: 295,
                          height: 50,
                          margin: EdgeInsets.only(right: 20, top: 20),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            cursorWidth: (3),
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: _linkController,
                          ))
                    ],
                  ),
                ],
              ),
              Column(children: [
                Container(
                  width: 750,
                  height: 340,
                  margin: EdgeInsets.only(right: 20, top: 10),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 10,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    cursorWidth: (3),
                    decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'دستور پخت',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    controller: _recipeController,
                  ),
                ),
              ])
            ]),
            Row(children: [
              Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: Text(
                  'مواد غذایی مورد نیاز',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 5 / 2),
                itemCount: Matname.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: Matname[index]['pressed'] == true
                            ? MaterialStateProperty.all<Color>(
                                Colors.blue.shade300,
                              )
                            : Matname[index]['tag'] == 'سبزیجات'
                                ? MaterialStateProperty.all<Color>(
                                    Color(0xff43a96f),
                                  )
                                : Matname[index]['tag'] == 'غلات'
                                    ? MaterialStateProperty.all<Color>(
                                        Color(0xffeac11d),
                                      )
                                    : Matname[index]['tag'] == 'حبوبات'
                                        ? MaterialStateProperty.all<Color>(
                                            Colors.brown,
                                          )
                                        : Matname[index]['tag'] == 'لبنیات'
                                            ? MaterialStateProperty.all<Color>(
                                                Color.fromRGBO(
                                                    132, 139, 121, 1),
                                              )
                                            : Matname[index]['tag'] == 'میوه ها'
                                                ? MaterialStateProperty.all<
                                                        Color>(
                                                    Colors.purple.shade600)
                                                : MaterialStateProperty.all<
                                                    Color>(Colors.red.shade400),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      setState(() {
                        Matname[index]['pressed'] = !Matname[index]['pressed'];
                      });
                    },
                    child: Center(
                        child: Text(
                      Matname[index]['matname'],
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
                  );
                },
              ),
            ),
            Row(children: [
              Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: Text(
                  'دسته بندی غذا',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ]),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tags[0] = true;
                        tags[1] = false;
                        tags[2] = false;
                      });
                    },
                    child: Text(
                      'مجلسی',
                      style: TextStyle(fontSize: 22),
                    ),
                    style: ButtonStyle(
                        backgroundColor: tags[0] == true
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffeac11d),
                              )
                            : MaterialStateProperty.all<Color>(
                                Color(0xff43a96f)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tags[0] = false;
                        tags[1] = true;
                        tags[2] = false;
                      });
                    },
                    child: Text(
                      'حاضری',
                      style: TextStyle(fontSize: 22),
                    ),
                    style: ButtonStyle(
                        backgroundColor: tags[1] == true
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffeac11d),
                              )
                            : MaterialStateProperty.all<Color>(
                                Color(0xff43a96f)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tags[0] = false;
                        tags[1] = false;
                        tags[2] = true;
                      });
                    },
                    child: Text(
                      'فست فود',
                      style: TextStyle(fontSize: 22),
                    ),
                    style: ButtonStyle(
                        backgroundColor: tags[2] == true
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffeac11d),
                              )
                            : MaterialStateProperty.all<Color>(
                                Color(0xff43a96f)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                  ),
                ),
                Container(
                  child: Text('مناسب برای :', style: TextStyle(fontSize: 30)),
                  margin: EdgeInsets.only(
                    right: 160,
                  ),
                ),
                Container(
                    width: 295,
                    height: 60,
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: TextField( 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      cursorWidth: (3),
                      decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      controller: _enoughforController,
                    ))
              ],
            ),
            Row(children: [
              Container(
                height: 50,
                width: 150,
                margin: EdgeInsets.only(right: 20, top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    for (var i = 0; i < Matname.length; i++) {
                      if (Matname[i]['pressed'] == true) {
                        selectedmat.add(Matname[i]['id']);
                      }
                    }
                    if (_nameController.text.isEmpty ||
                        _calorieController.text.isEmpty ||
                        _enoughforController.text.isEmpty ||
                        _linkController.text.isEmpty ||
                        _timeController.text.isEmpty ||
                        _recipeController.text.isEmpty) {
                      errors('لطفا تمامی فیلد ها را پر کنید');
                    } else if (tags[0] == false &&
                        tags[1] == false &&
                        tags[2] == false) {
                      errors('لطفا یک دسته را انتخاب کنید');
                    } else if (selectedmat.length == 0) {
                      errors('لطفا حداقل یک ماده غذایی را انتخاب کنید');
                    } else {
                      Upload();
                    }
                  },
                  child: const Text("افزودن غذا"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff43a96f)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                ),
              ),
            ])
          ],
        )))
      ]),
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
}
