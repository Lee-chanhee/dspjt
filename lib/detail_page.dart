import 'package:dsproject1/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detail_page extends StatefulWidget {
  const detail_page({Key? key}) : super(key: key);

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  @override
  int _counter = 0;
  int currentIndex = 0;
  final List fileformat = ["jpg", "txt", "csv", "png", 'agg'];

  final List<Map<String, String>> requestform = const [
    {
      "format": "jpg",
      "format1": "img",
      "title1": "풍경",
      "title2": "숲",
      "number": "0",
      "number1": "50",
    },
    {
      "format": "txt",
      "format1": "lan",
      "title1": "풍경",
      "title2": "숲",
      "number": "0",
      "number1": "30",
    },
    {
      "format": "csv",
      "format1": "img",
      "title1": "풍경",
      "title2": "숲",
      "number": "0",
      "number1": "40",
    },
    {
      "format": "png",
      "format1": "img",
      "title1": "풍경",
      "title2": "숲",
      "number": "0",
      "number1": "20",
    },
    {
      "format": "csv",
      "format1": "data",
      "title1": "풍경",
      "title2": "숲",
      "number": "0",
      "number1": "15",
    },
  ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "데이터 모집 상세페이지",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.amber,
              width: double.infinity,
              height: 250,
              child: Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment.center,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 206, 78, 69)
                              .withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "RAW",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color:
                            Color.fromARGB(255, 206, 78, 69).withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "남자 인물 정면사진 모음(백인, 흑인, 황인 등 인종 별 분류 데이터셋)",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            // border: Border.all(width: 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Image.asset(
                            'assets/images/1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: Text(
                          "DS유저_01",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(height: 5, color: Colors.black.withOpacity(0.2)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "참가 기간",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2022.04.08 ~ 2022.08.30",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[800]),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          alignment: Alignment.center,
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            // border: Border.all(
                            //     width: 1,
                            //     color: Color.fromARGB(255, 206, 78, 69)
                            //         .withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "D-10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "상세 정보",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.amber,
                    width: double.infinity,
                    height: 250,
                    child:
                        Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  detailContent(
                      "세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다. 그것은 세계 문자 가운데 유일하게 한글만이 그것을 만든 사람과 반포일을 알며, 글자를 만든 원리까지 알기 때문입니다. 세계에 이런 문자는 없습니다. 그래서 한글은, 정확히 말해 [훈민정음 해례본](국보 70호)은 진즉에 유네스코 세계기록유산으로 등재되었습니다. ‘한글’이라는 이름은 1910년대 초에 주시경 선생을 비롯한 한글학자들이 쓰기 시작한 것입니다. 여기서 ‘한’이란 크다는 것을 뜻하니, 한글은 ‘큰 글’을 말한다고 하겠습니다.[네이버 지식백과] 한글 - 세상에서 가장 신비한 문자 (위대한 문화유산, 최준식) 출처: https://d-dual.tistory.com/7 [🧚🏻 Seulki's Development blog 🧚🏻]"),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "01. 인종 별 폴더정리",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  detailContent("세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다."),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "02. 가로 4820px 이상 고화질 데이터",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  detailContent("세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다."),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "업로드",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              alignment: Alignment.center,
                              width: 60,
                              height: 25,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.orange),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "JPG",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.orange),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "img/풍경-숲(0/50)",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (() {}),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                alignment: Alignment.center,
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  // border: Border.all(
                                  //     width: 1,
                                  //     color: Color.fromARGB(255, 206, 78, 69)
                                  //         .withOpacity(0.7)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cloud_upload,
                                      color: Colors.white,
                                    ),
                                    Spacer(),
                                    Text(
                                      "업로드",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Divider(
                          height: 5,
                          color: Colors.black.withOpacity(0.3),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              alignment: Alignment.center,
                              width: 60,
                              height: 25,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.orange),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "JPG",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.orange),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "img/풍경-숲(0/50)",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (() {}),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                alignment: Alignment.center,
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  // border: Border.all(
                                  //     width: 1,
                                  //     color: Color.fromARGB(255, 206, 78, 69)
                                  //         .withOpacity(0.7)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cloud_upload,
                                      color: Colors.white,
                                    ),
                                    Spacer(),
                                    Text(
                                      "업로드",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Divider(
                          height: 5,
                          color: Colors.black.withOpacity(0.3),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue,
                        ),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "구매하기",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class grid_fileformat extends StatelessWidget {
  const grid_fileformat({
    Key? key,
    required this.requestform,
  }) : super(key: key);

  final List<Map<String, String>> requestform;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 2),
        itemCount: requestform.length,
        itemBuilder: (BuildContext context, int index) {
          final request_data = requestform[index];
          final format1 = request_data["format"] ?? "RAW";
          return Container(
            margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            child: Text(
              format1,
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

Widget detailTitle1(String st1) {
  return Container(
    alignment: Alignment.centerLeft,
    child:
        Text(st1, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
  );
}

Widget detailTitle2(String st1) {
  return Container(
    alignment: Alignment.centerLeft,
    child:
        Text(st1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}

Widget detailContent(String st1) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(st1, style: TextStyle(fontSize: 15)),
  );
}

Widget detaildevider() {
  return Divider(
    height: 5,
    color: Colors.black,
  );
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dsproject1/auth_service.dart';
// import 'package:dsproject1/dataservice.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // class detail_page extends StatefulWidget {
// //   final String request_id;
// //   const detail_page({Key? key, required this.request_id}) : super(key: key);

// //   @override
// //   State<detail_page> createState() => _detail_pageState();
// // }

// class detail_page extends StatefulWidget {
//   const detail_page({Key? key}) : super(key: key);

//   @override
//   State<detail_page> createState() => _detail_pageState();
// }

// class _detail_pageState extends State<detail_page> {
//   // final category = request["category"] ?? "RAW";
//   // final conditions = request["conditions"] ?? "모집이름";
//   // final due_date = request["due_date"] ?? "0";
//   // final start_date = request["start_date"] ?? "0";
//   // final file_types = request["file_types"] ?? "모집이름";
//   // final photo = request["photo"] ?? "0";
//   // final request_info = request["request_info"] ?? "RAW";
//   // final reward = request["reward"] ?? "모집이름";
//   // final title = request["title"] ?? "0";
//   // final uid = request["uid"] ?? "0";
//   @override
//   int _counter = 0;
//   int currentIndex = 0;
//   final List fileformat = ["jpg", "txt", "csv", "png", 'agg'];
//   final List<Map<String, String>> requestform = const [
//     {
//       "format": "jpg",
//       "format1": "img",
//       "title1": "풍경",
//       "title2": "숲",
//       "number": "0",
//       "number1": "50",
//     },
//     {
//       "format": "txt",
//       "format1": "lan",
//       "title1": "풍경",
//       "title2": "숲",
//       "number": "0",
//       "number1": "30",
//     },
//     {
//       "format": "csv",
//       "format1": "img",
//       "title1": "풍경",
//       "title2": "숲",
//       "number": "0",
//       "number1": "40",
//     },
//     {
//       "format": "png",
//       "format1": "img",
//       "title1": "풍경",
//       "title2": "숲",
//       "number": "0",
//       "number1": "20",
//     },
//     {
//       "format": "csv",
//       "format1": "data",
//       "title1": "풍경",
//       "title2": "숲",
//       "number": "0",
//       "number1": "15",
//     },
//   ];

//   Widget build(BuildContext context) {
//     // final id = widget.request_id;
//     final authService = context.read<AuthService>();
//     final user = authService.currentUser()!;
//     String title;

//     return Consumer<dataService>(builder: (context, service, child) {
//       return FutureBuilder<QuerySnapshot>(
//           future: service.read(user.uid),
//           builder: (context, snapshot) {
//             final docs = snapshot.data?.docs ?? [];
//             final doc = dataService();
// // .fireStoreReadTest('request_collection', id)
// // .data();
// // final title = doc('title') ?? "RAW";

//             return Consumer<dataService>(builder: (context, service, child) {
//               return SafeArea(
//                 child: Scaffold(
//                   appBar: AppBar(
//                     backgroundColor: Colors.black,
//                     // title: Text(
//                     //   widget.request_id,
//                     //   style: TextStyle(fontWeight: FontWeight.bold),
//                     // ),
//                     centerTitle: true,
//                   ),
//                   body: Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           print(doc);
//                         },
//                         child: Container(
//                           height: 20,
//                           width: 20,
//                           color: Colors.amber,
//                         ),
//                       ),
//                       Container(
//                         height: 60,
//                         decoration:
//                             BoxDecoration(color: Colors.grey.withOpacity(0.4)),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.all(5),
//                               alignment: Alignment.center,
//                               width: 100,
//                               height: 25,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.black),
//                               // child: Text(
//                               //   widget.request_id,
//                               //   style: TextStyle(
//                               //       fontSize: 13, color: Colors.white),
//                               // ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.all(5),
//                               height: 25,
//                               // child: Text(
//                               //   widget.request_id,
//                               //   style: TextStyle(
//                               //       fontSize: 15,
//                               //       fontWeight: FontWeight.bold,
//                               //       color: Colors.black),
//                               // ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           margin: EdgeInsets.symmetric(horizontal: 20),
//                           height: 480,
//                           child: ListView(
//                             children: [
//                               SizedBox(height: 10),
//                               detailTitle1("참가 기간"),
//                               SizedBox(height: 10),
//                               detailContent("2020.04.28~2022.08.30"),
//                               SizedBox(height: 30),
//                               detailTitle1("상세 정보"),
//                               SizedBox(height: 20),
//                               Container(
//                                 height: 200,
//                                 child: Image.asset('assets/images/1.jpg',
//                                     fit: BoxFit.cover),
//                               ),
//                               SizedBox(height: 20),
//                               detailContent(
//                                   "세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다. 그것은 세계 문자 가운데 유일하게 한글만이 그것을 만든 사람과 반포일을 알며, 글자를 만든 원리까지 알기 때문입니다. 세계에 이런 문자는 없습니다. 그래서 한글은, 정확히 말해 [훈민정음 해례본](국보 70호)은 진즉에 유네스코 세계기록유산으로 등재되었습니다. ‘한글’이라는 이름은 1910년대 초에 주시경 선생을 비롯한 한글학자들이 쓰기 시작한 것입니다. 여기서 ‘한’이란 크다는 것을 뜻하니, 한글은 ‘큰 글’을 말한다고 하겠습니다.[네이버 지식백과] 한글 - 세상에서 가장 신비한 문자 (위대한 문화유산, 최준식) 출처: https://d-dual.tistory.com/7 [🧚🏻 Seulki's Development blog 🧚🏻]"),
//                               SizedBox(height: 20),
//                               detailTitle2("조건_01"),
//                               SizedBox(height: 20),
//                               detailContent(
//                                   "세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다"),
//                               SizedBox(height: 20),
//                               detailTitle2("조건_02"),
//                               SizedBox(height: 20),
//                               detailContent(
//                                   "세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다"),
//                               SizedBox(height: 40),
//                               detailTitle1("파일 형식"),
//                               SizedBox(height: 20),
//                               grid_fileformat(requestform: requestform),
//                               detailTitle1("업로드"),
//                               Container(
//                                 height: 400,
//                                 child: ListView.builder(
//                                   itemCount: requestform.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     final requestData = requestform[index];
//                                     final format =
//                                         requestData["format"] ?? "RAW";
//                                     final format1 =
//                                         requestData["format1"] ?? "RAW";
//                                     final title1 =
//                                         requestData["title1"] ?? "RAW";
//                                     final title2 =
//                                         requestData["title2"] ?? "RAW";
//                                     final number =
//                                         requestData["number"] ?? "RAW";
//                                     final number1 =
//                                         requestData["number1"] ?? "RAW";
//                                     return Container(
//                                       height: 60,
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Container(
//                                                 margin: EdgeInsets.all(5),
//                                                 alignment: Alignment.center,
//                                                 width: 60,
//                                                 height: 25,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20),
//                                                     color: Colors.black),
//                                                 child: Text(
//                                                   format,
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       color: Colors.white),
//                                                 ),
//                                               ),
//                                               Text(format1,
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text("/",
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text(title1,
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text("-",
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text(title2,
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text("(",
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text(number,
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text("/",
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text(number1,
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Text(")",
//                                                   style:
//                                                       TextStyle(fontSize: 18)),
//                                               Spacer(),
//                                               GestureDetector(
//                                                 child: Container(
//                                                   alignment: Alignment.center,
//                                                   width: 80,
//                                                   height: 35,
//                                                   decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                           width: 2,
//                                                           color: Colors.black),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20),
//                                                       color: Colors.white),
//                                                   child: Text(
//                                                     "업로드",
//                                                     style: TextStyle(
//                                                         fontSize: 15,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           detaildevider()
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   bottomNavigationBar: Container(
//                     decoration: BoxDecoration(),
//                     clipBehavior: Clip.antiAlias,
//                     child: BottomNavigationBar(
//                       type: BottomNavigationBarType.fixed,
//                       backgroundColor: Colors.black,
//                       currentIndex: currentIndex,
//                       onTap: (int newIndex) {
//                         setState(() {
//                           currentIndex = newIndex;
//                         });
//                       },
//                       iconSize: 24,
//                       unselectedItemColor: Colors.grey,
//                       selectedItemColor: Colors.white,
//                       items: [
//                         BottomNavigationBarItem(
//                             icon: Icon(Icons.home_filled), label: "거래소"),
//                         BottomNavigationBarItem(
//                             icon: Icon(Icons.home_filled), label: "데이터 판매"),
//                         BottomNavigationBarItem(
//                             icon: Icon(Icons.home_filled), label: "데이터 의뢰"),
//                         BottomNavigationBarItem(
//                             icon: Icon(Icons.home_filled), label: "마이페이지"),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             });
//           });
//     });
//   }
// }

// class grid_fileformat extends StatelessWidget {
//   const grid_fileformat({
//     Key? key,
//     required this.requestform,
//   }) : super(key: key);

//   final List<Map<String, String>> requestform;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120,
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4, childAspectRatio: 2),
//         itemCount: requestform.length,
//         itemBuilder: (BuildContext context, int index) {
//           final requestData = requestform[index];
//           final format1 = requestData["format"] ?? "RAW";
//           return Container(
//             margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20), color: Colors.black),
//             child: Text(
//               format1,
//               style: TextStyle(fontSize: 13, color: Colors.white),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// Widget detailTitle1(String st1) {
//   return Container(
//     alignment: Alignment.centerLeft,
//     child:
//         Text(st1, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//   );
// }

// Widget detailTitle2(String st1) {
//   return Container(
//     alignment: Alignment.centerLeft,
//     child:
//         Text(st1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//   );
// }

// Widget detailContent(String st1) {
//   return Container(
//     alignment: Alignment.centerLeft,
//     child: Text(st1, style: TextStyle(fontSize: 15)),
//   );
// }

// Widget detaildevider() {
//   return Divider(
//     height: 5,
//     color: Colors.black,
//   );
// }
