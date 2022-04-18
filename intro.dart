import 'package:dsproject1/login.dart';
import 'package:dsproject1/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainpage.dart';

class intro_page extends StatelessWidget {
  const intro_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => onboarding_page(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: Colors.amber,
              child: Text("onboarding"),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => main_page(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              color: Colors.amber,
              child: Text("mainpage"),
            ),
          ),
        ],
      ),
    ));
  }
}
