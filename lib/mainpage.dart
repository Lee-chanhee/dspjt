import 'package:dsproject1/detail_page.dart';
import 'package:dsproject1/request_form.dart';
import 'package:dsproject1/selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);
  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> with TickerProviderStateMixin {
  int _counter = 0;
  int currentIndex = 0;
  TabController? controller;

  final List<Map<String, String>> recommendRequest = const [
    {
      "type": "RAW",
      "name": "풍경사진 데이터 모집",
      "Reward": "10,000,000",
      "left": "23:00:00",
      "no": "0000",
    },
    {
      "type": "RAW",
      "name": "풍경사진 데이터 모집",
      "Reward": "10,000,000",
      "left": "23:00:00",
      "no": "0000",
    },
    {
      "type": "RAW",
      "name": "풍경사진 데이터 모집",
      "Reward": "10,000,000",
      "left": "23:00:00",
      "no": "0000",
    },
    {
      "type": "RAW",
      "name": "풍경사진 데이터 모집",
      "Reward": "10,000,000",
      "left": "23:00:00",
      "no": "0000",
    },
    {
      "type": "RAW",
      "name": "풍경사진 데이터 모집",
      "Reward": "10,000,000",
      "left": "23:04",
      "no": "0000",
    },
  ];
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
      mainpage_widget(
          controller: controller, recommendRequest: recommendRequest),
      Text('home'),
      RequestForm(),
      Placeholder(),
      Placeholder(),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "DATA STORE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: _widgetOptions.elementAt(currentIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            currentIndex: currentIndex,
            onTap: (int newIndex) {
              setState(() {
                currentIndex = newIndex;
              });
            },
            iconSize: 24,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "거래소"),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "데이터 판매",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "데이터 의뢰"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "마이페이지"),
            ],
          ),
        ),
        // floatingActionButton: currentIndex == 0
        //     ? FloatingActionButton(
        //         backgroundColor: Colors.amber,
        //         onPressed: () {},
        //         child: Icon(Icons.plus_one),
        //       )
        //     : null,
      ),
    );
  }
}

class mainpage_widget extends StatelessWidget {
  const mainpage_widget({
    Key? key,
    required this.controller,
    required this.recommendRequest,
  }) : super(key: key);

  final TabController? controller;
  final List<Map<String, String>> recommendRequest;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(children: [
          Container(
            alignment: Alignment.center,
            color: Color.fromARGB(112, 227, 89, 89),
            width: double.infinity,
            height: 180,
            child: TabBarView(
              controller: controller,
              children: [
                Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
                Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
                Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
                Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
                Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
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
                controller: controller,
                color: Colors.white,
                selectedColor: Colors.black,
              ),
            ),
          )
        ]),
        // Container(
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
        //   decoration: BoxDecoration(
        //       color: Color.fromARGB(255, 209, 209, 209),
        //       borderRadius: BorderRadius.circular(10)),
        //   width: double.infinity,
        //   height: 45,
        //   child: TextField(
        //     decoration: InputDecoration(
        //         hintText: "Search",
        //         border: InputBorder.none,
        //         icon: Padding(
        //             padding: EdgeInsets.only(left: 13),
        //             child: Icon(
        //               Icons.search,
        //               color: Colors.black,
        //             ))),
        //   ),
        // ),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          height: 900,
          child: Column(
            children: [
              mainTitle(
                "리워드 BEST10",
                "참여 보상이 높은 상위 10개의 공고를 확인해보세요!",
              ),
              SizedBox(
                height: 10,
              ),
              requestTile(recommendRequest: recommendRequest),
              SizedBox(
                height: 40,
              ),
              mainTitle(
                "마감임박 공고",
                "참여 보상이 높은 상위 10개의 공고를 확인해보세요!",
              ),
              SizedBox(
                height: 10,
              ),
              requestTile(recommendRequest: recommendRequest),
              SizedBox(
                height: 40,
              ),
              mainTitle(
                "마감임박 공고",
                "참여 보상이 높은 상위 10개의 공고를 확인해보세요!",
              ),
              SizedBox(
                height: 10,
              ),
              requestTile(recommendRequest: recommendRequest),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => detail_page(),
                                ),
                              );
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
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.alarm),
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
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}

class data_request {
  String type = '';
  String name = '';
  String reward = '';
  String left = '';
  String number = '';
  data_request(
    this.type,
    this.name,
    this.reward,
    this.left,
    this.number,
  ); // 생성자
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
