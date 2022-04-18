import 'package:dsproject1/login.dart';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class selling_page extends StatelessWidget {
  const selling_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
          alignment: Alignment.center,
          height: 100,
          width: 100,
          color: Colors.amber,
          child: Text("detail"),
        ),
      ),
    ));
  }
}
