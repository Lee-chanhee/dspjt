import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dataservice.dart';
import 'detail_page.dart';
import 'login.dart';
import 'mypage.dart';
import 'purchase.dart';
import 'request_form.dart';
import 'selling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);
  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> with TickerProviderStateMixin {
  int _counter = 0;
  int currentIndex = 0;
  TabController? controller;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void initState() {
    controller = TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      mainpage_widget(controller: controller),
      purchasePage(),
      RequestForm(),
      mypage(),
    ];

    return Consumer<dataService_request>(
        builder: (context, dataservice, child) {
      return SafeArea(
        child: Scaffold(
          body: _widgetOptions.elementAt(currentIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border.all(
              width: 2,
              color: Colors.grey.withOpacity(0.2),
            )),
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (int newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              iconSize: 24,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "홈"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: "데이터 판매",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "데이터 구매"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "마이페이지"),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class mainpage_widget extends StatefulWidget {
  const mainpage_widget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController? controller;

  @override
  State<mainpage_widget> createState() => _mainpage_widgetState();
}

class _mainpage_widgetState extends State<mainpage_widget> {
  final request_id = "";
  int popular_data_num = 4;
  int best10_card_num = 2;
  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    //////////////////// 샘플데이터////////////////////////////////////

    final List<Map<String, dynamic>> sellingData = const [
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
      {
        'photo': 'photo',
        'title': 'test1',
        'reward': '1231412413',
      },
    ];
    print(user.uid);

    return Consumer<dataService_request>(builder: (context, service, child) {
      if (best10_card_num <= sellingData.length)
        best10_card_num = best10_card_num;
      else
        best10_card_num = sellingData.length;

      if (popular_data_num <= sellingData.length)
        popular_data_num = popular_data_num;
      else
        popular_data_num = sellingData.length;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "DATA STORE",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  CupertinoIcons.bell_solid,
                  size: 26.0,
                  color: Colors.white,
                ),
                onPressed: () {}),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  AuthService().signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login_page()));
                },
                child: Center(child: Text("logout")),
              ),
            )
          ],
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: service.read(),
            builder: (context, snapshot) {
              final docs = snapshot.data?.docs ?? [];
              print(docs.length);
              return ListView(
                children: [
                  /////////////////////////////////광고페이지 /////////////////////////////////////////

                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Stack(children: [
                      Container(
                        alignment: Alignment.center,
                        color: Color.fromARGB(112, 227, 89, 89),
                        width: double.infinity,
                        height: 200,
                        child: TabBarView(
                          controller: widget.controller,
                          children: [
                            Image.asset('assets/images/1.jpg',
                                fit: BoxFit.cover),
                            Image.asset('assets/images/2.jpg',
                                fit: BoxFit.cover),
                            Image.asset('assets/images/1.jpg',
                                fit: BoxFit.cover),
                            Image.asset('assets/images/2.jpg',
                                fit: BoxFit.cover),
                            Image.asset('assets/images/1.jpg',
                                fit: BoxFit.cover),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        left: 0.0,
                        bottom: 5,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 0),
                          child: TabPageSelector(
                            indicatorSize: 8,
                            controller: widget.controller,
                            color: Colors.white,
                            selectedColor: Colors.black,
                          ),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  /////////////////////////////////가장 인기있는 데이터 모음 /////////////////////////////////////////

                  mainTitle(
                    "지금 가장 인기있는 데이터 모음!",
                    "현재 사람들이 가장 많이 구매한 데이터세트를 소개합니다.",
                  ),

                  for (var i = 0; i < popular_data_num; i += 2)
                    Row(children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            height: 250,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detail_page(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 12,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Container(
                                        height: 100,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(width: 1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          'assets/images/1.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // border: Border.all(width: 1),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 7, 10, 0),
                                              child: Container(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  "남자 인물 정면사진 모음(백인, 흑인, 황인)",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                              child: Container(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  "27,000",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (i + 1 == popular_data_num)
                        Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                            ))
                      else
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 250,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => detail_page(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 12,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Container(
                                          height: 100,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            // border: Border.all(width: 1),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    0), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            'assets/images/1.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Container(
                                        height: 100,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(width: 1),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 7, 10, 0),
                                                child: Container(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    "남자 인물 정면사진 모음(백인, 흑인, 황인)",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 0),
                                                child: Container(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    "27,000",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                    ]),

                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      popular_data_num += 2;

                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      alignment: Alignment.center,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "더 보기",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  /////////////////////////////////리워드 Best 10 만들기 /////////////////////////////////////////////////////////

                  mainTitle(
                    "리워드 BEST10",
                    "참여 보상이 높은 상위 10개의 공고를 확인해보세요!",
                  ),

                  for (var i = 0; i < best10_card_num; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detail_page(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(5, 0, 5, 0),
                                          alignment: Alignment.center,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromARGB(
                                                        255, 206, 78, 69)
                                                    .withOpacity(0.7)),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            docs[i].get('category'),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                      255, 206, 78, 69)
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(),
                                          height: 40,
                                          child: Text(
                                            docs[i].get('title'),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          alignment: Alignment.center,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            // border: Border.all(
                                            //     width: 1,
                                            //     color: Color.fromARGB(255, 206, 78, 69)
                                            //         .withOpacity(0.7)),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            "D-10",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(),
                                          height: 20,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 0, 0, 0),
                                            child: Text(
                                              '형식',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(),
                                          height: 20,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 0, 0, 0),
                                            child: Text(
                                              docs[i]
                                                  .get('file_type')
                                                  .toString()
                                                  .substring(1)
                                                  .replaceAll(']', ''),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(),
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 5, 0, 0),
                                            child: Text(
                                              "조건",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(),
                                          height: 45,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 0),
                                            child: Text(
                                              docs[i]
                                                  .get('file_info')
                                                  .toString()
                                                  .substring(1)
                                                  .replaceAll(']', ''),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(),
                                          height: 45,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 0, 0, 0),
                                            child: Text(
                                              "리워드",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Expanded(
                                        flex: 9,
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          decoration: BoxDecoration(),
                                          height: 45,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 20, 0),
                                            child: Text(
                                              docs[i].get('reward'),
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      best10_card_num += 2;
                      if (best10_card_num > docs.length)
                        best10_card_num = docs.length;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      alignment: Alignment.center,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "더 보기",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  // requestTile(recommendRequest: recommendRequest),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(),
                ],
              );
            }),
      );
    });
  }
}

class requestTile extends StatelessWidget {
  const requestTile({
    Key? key,
    required this.recommendRequest,
  }) : super(key: key);

  final List<Map<String, String>> recommendRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 횡스크롤
        itemCount: recommendRequest.length,
        itemBuilder: (context, index) {
          final request = recommendRequest[index];
          final type = request["type"] ?? "RAW";
          final name = request["name"] ?? "모집이름";
          final reward = request["Reward"] ?? "0";
          final left = request["left"] ?? "00:00";

          return Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            height: 2,
            width: 280,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blueGrey),
                            child: Text(
                              type,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            height: 25,
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                            height: 25,
                            child: Text(
                              "Reward",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            margin: EdgeInsets.all(5),
                            height: 25,
                            child: Text(
                              reward,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                            height: 25,
                            child: Text(
                              "남은기간",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                            height: 25,
                            child: Text(
                              left,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => detail_page(),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black),
                              child: Text(
                                "참가하기",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget mainTitle(String st1, String st2) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                st1,
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ]),
            Text(st2,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
          ],
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}

class AlbumCard extends StatelessWidget {
  const AlbumCard(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.artist})
      : super(key: key);

  final String imageUrl;
  final String name;
  final String artist;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.29,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(artist),
        ],
      ),
    );
  }
}
