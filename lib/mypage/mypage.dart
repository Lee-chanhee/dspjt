import 'package:dsproject1/loginpage.dart';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mypage extends StatelessWidget {
  const mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          color: Colors.amber,
          child: Text("mypage"),
        ),
      ),
    ));
  }
}
