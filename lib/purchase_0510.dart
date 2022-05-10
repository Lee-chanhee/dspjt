import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedValue;
  TextEditingController editingController = TextEditingController();
  List<String> items = [
    '높은보상',
    '마감임박',
  ];
  List<String> entries = [
    '풍경 사진 데이터 모집',
    '남성 인물 사진',
    '고양이 데이터',
    '강아지 데이터',
  ];
  List<String> skills = [
    '저작권에 문제가 없는 원본 이미지 파일',
    '남성의 얼굴 2가지 감정 표정(웃음/화남)',
    '고양이 얼굴 사진, 저작권에 문제가 없는 원본 이미지 파일',
    '강아지 얼굴 사진, 저작권에 문제가 없는 원본 이미지 파일',
  ];

  List<String> rewards = [
    '10,000,000',
    '20,000,000',
    '30,000,000',
    '40,000,000',
  ];

  List<String> searchedList = [];
  @override
  Widget build(BuildContext context) {
    // 화면에 보이는 영역

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "DATA STORE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

////////////////////////////////
      body: Column(
        children: [
          /// 검색
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              onChanged: (value) {
                searchedList.clear();
                setState(() {
                  entries.forEach((element) {
                    if (element.contains(editingController.text)) {
                      searchedList.add(element);
                    }
                  });
                });
                print(searchedList);
                print(searchedList.length);
                // p
              },
              controller: editingController,
              decoration: InputDecoration(
                hintText: "상품을 검색해주세요.",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                // 돋보기 아이콘
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("돋보기 아이콘 클릭");
                  },
                ),
              ),
            ),
          ),
          Divider(height: 1),

//////////////////////////////////////////////////////// dropdown button

          Container(
            alignment: Alignment.topLeft,
            // child: DropdownButtonHideUnderline(
            //   child: DropdownButton2(
            //     isExpanded: true,
            //     hint: Row(
            //       children: const [
            //         Icon(
            //           Icons.list,
            //           size: 16,
            //           color: Colors.black,
            //         ),
            //         SizedBox(
            //           width: 4,
            //         ),
            //         Expanded(
            //           child: Text(
            //             '정렬',
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.black,
            //             ),
            //             overflow: TextOverflow.ellipsis,
            //           ),
            //         ),
            //       ],
            //     ),
            //     items: items
            //         .map((item) => DropdownMenuItem<String>(
            //               value: item,
            //               child: Text(
            //                 item,
            //                 style: const TextStyle(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.black,
            //                 ),
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ))
            //         .toList(),
            //     value: selectedValue,
            //     onChanged: (value) {
            //       setState(() {
            //         selectedValue = value as String;
            //       });
            //     },
            //     icon: const Icon(
            //       Icons.arrow_forward_ios_outlined,
            //     ),
            //     iconSize: 14,
            //     iconEnabledColor: Colors.black,
            //     iconDisabledColor: Colors.grey,
            //     buttonHeight: 50,
            //     buttonWidth: 160,
            //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            //     buttonDecoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(14),
            //       border: Border.all(
            //         color: Colors.white,
            //       ),
            //       color: Colors.white,
            //     ),
            //     buttonElevation: 2,
            //     itemHeight: 40,
            //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
            //     dropdownMaxHeight: 200,
            //     dropdownWidth: 200,
            //     dropdownPadding: null,
            //     dropdownDecoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(14),
            //       color: Colors.white,
            //     ),
            //     dropdownElevation: 8,
            //     scrollbarRadius: const Radius.circular(40),
            //     scrollbarThickness: 6,
            //     scrollbarAlwaysShow: true,
            //     offset: const Offset(-20, 0),
            //   ),
            // ),
          ),
//////////////////////////////////////////////////////// 모집 공고

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: searchedList.length,
              itemBuilder: (BuildContext context, int index) {
                // return Container(
                //   color: Colors.red,
                //   height: 100,
                // );
                return Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                        height: 2,
                      ),
                      Center(
                          child: Text(
                        ' ${searchedList[index]}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '요구사항',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          ' ${searchedList[index]}',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '리워드',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          ' ${searchedList[index]}',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2, top: 0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'APPLY',
                              style: TextStyle(fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: Color(0xff000000),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
