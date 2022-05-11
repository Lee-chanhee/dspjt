import 'package:dsproject1/login.dart';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dsproject1/mypage/mypage_header.dart';
import 'package:dsproject1/mypage/mypage_drawer.dart';
import 'package:dsproject1/mypage/mypage_info.dart';
import 'package:dsproject1/mypage/mypage_buttons.dart';
import 'package:dsproject1/mypage/mypage_tab.dart';
import 'package:dsproject1/mypage_setting.dart';

import 'auth_service.dart';

class mypage extends StatelessWidget {
  const mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: mypage_drawer(),
      // appBar: mypage_AppBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_back,
            size: 26.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => main_page()));
          },
        ),
        title: Text(
          "마이페이지",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       CupertinoIcons.settings,
        //       //size: 26.0,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => mypage_setting()));
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          mypage_header(),
          // SizedBox(height: 10),
          // mypage_info(),
          // SizedBox(height: 10),
          // mypage_buttons(),
          SizedBox(height: 10),
          Expanded(child: mypage_tab()),
        ],
      ),
    );
    // Widget titleSection = Container(
    //   padding: const EdgeInsets.all(32),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         /*1*/
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             /*2*/
    //             Container(
    //               padding: const EdgeInsets.only(bottom: 8),
    //               child: const Text(
    //                 'Oeschinen Lake Campground',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //             Text(
    //               'Kandersteg, Switzerland',
    //               style: TextStyle(
    //                 color: Colors.grey[500],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       /*3*/
    //       Icon(
    //         Icons.star,
    //         color: Colors.red[500],
    //       ),
    //       const Text('41'),
    //     ],
    //   ),
    // );

    // return MaterialApp(
    //   theme: ThemeData(textTheme: GoogleFonts.getTextTheme('Jua')),
    //   home: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.white,
    //       title: Text(
    //         "마이페이지",
    //         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    //       ),
    //       centerTitle: true,
    //       leading: IconButton(
    //         icon: Icon(
    //           CupertinoIcons.chevron_back,
    //           size: 26.0,
    //           color: Colors.black,
    //         ),
    //         onPressed: () {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => main_page()));
    //         },
    //       ),
    //     ),
    //     body: ListView(
    //       children: [
    //         titleSection,
    //         // buttonSection,
    //         // textSection,
    //       ],
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     leading: IconButton(
    //       icon: Icon(
    //         CupertinoIcons.chevron_back,
    //         size: 26.0,
    //         color: Colors.black,
    //       ),
    //       onPressed: () {
    //         Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => main_page()));
    //       },
    //     ),
    //     title: Text(
    //       "마이페이지",
    //       style: TextStyle(color: Colors.black), // fontWeight: FontWeight.bold,
    //     ),
    //     centerTitle: true,
    //   ),
    // );
  }

  // AppBar mypage_AppBar() {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     leading: IconButton(
  //       icon: Icon(
  //         CupertinoIcons.chevron_back,
  //         size: 26.0,
  //         color: Colors.black,
  //       ),
  //       onPressed: () {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => main_page()));
  //       },
  //     ),
  //     title: Text(
  //       "마이페이지",
  //       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
  //     ),
  //     centerTitle: true,
  //   );
  // }
}
