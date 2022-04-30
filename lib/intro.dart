import 'package:dsproject1/loginpage.dart';
import 'package:dsproject1/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainpage.dart';

class intro_page extends StatelessWidget {
  const intro_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int file_need = 100;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Row(
            children: [
              Expanded(
                flex: 30,
                child: Container(
                  height: 20,
                  width: 20,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 70,
                child: Container(
                  height: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
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
        ],
      ),
    ));
  }
}
