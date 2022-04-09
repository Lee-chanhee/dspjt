import 'package:dsproject1/login.dart';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mypage_setting extends StatelessWidget {
  const mypage_setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => login_page(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          color: Colors.amber,
          child: Text("mypage_setting"),
        ),
      ),
    ));
  }
}
