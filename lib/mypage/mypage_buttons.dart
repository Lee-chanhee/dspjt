import 'package:flutter/material.dart';

class mypage_buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        followButton(),
        messageButton(),
      ],
    );
  }

  Widget followButton() {
    return InkWell(
      onTap: () {
        print("Follow 버튼 클릭 됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 40,
        child: Text(
          "Follow",
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget messageButton() {
    return InkWell(
      onTap: () {
        print("Message 버튼 클릭 됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 40,
        child: Text(
          "Message",
          style: TextStyle(color: Colors.black),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
      ),
    );
  }
}
