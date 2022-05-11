import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mypage_setting.dart';

class mypage_header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10),
        buildHeaderAvatar(),
        SizedBox(width: 10),
        buildHeaderProfile(context),
        SizedBox(width: 10),
      ],
    );
  }

  Widget buildHeaderAvatar() {
    return SizedBox(
      width: 80,
      height: 80,
      child: CircleAvatar(backgroundImage: AssetImage('assets/images/1.jpg')),
    );
  }

  // Widget buildHeaderProfile(context) {
  //   return Card(
  //     child: ListTile(
  //       title: Text(
  //         "고양이",
  //         style: TextStyle(
  //           fontSize: 25,
  //           fontWeight: FontWeight.w700,
  //         ),
  //       ),
  //       trailing: IconButton(
  //         icon: Icon(Icons.settings),
  //         onPressed: () async {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => mypage_setting()));
  //         },
  //       ),
  //     ),
  //   );
  // }

  Widget buildHeaderProfile(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "고양이",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            //size: 26.0,
            color: Colors.black,
          ),
          alignment: Alignment.centerRight,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => mypageSetting()));
          },
        ),
      ],
    );
  }
}
