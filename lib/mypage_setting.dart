import 'package:dsproject1/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dsproject1/login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'mypage.dart';

class mypageSetting extends StatefulWidget {
  const mypageSetting({Key? key}) : super(key: key);
  @override
  State<mypageSetting> createState() => _mypage_setting_State();
}

class _mypage_setting_State extends State<mypageSetting> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      final user = authService.currentUser();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.chevron_back,
              size: 26.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => mypage()));
            },
          ),
          title: Text(
            "개인정보수정",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Form(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) =>
                        (value!.isEmpty) ? "이메일을 입력해주세요" : null,
                    // style: style,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "이메일",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) =>
                        (value!.isEmpty) ? "비밀번호을 입력해주세요" : null,
                    // style: style,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "비밀번호",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: passwordConfirmController,
                    obscureText: true,
                    validator: (value) =>
                        (value!.isEmpty) ? "비밀번호를 확인해주세요" : null,
                    // style: style,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "비밀번호확인",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.lightBlue,
                    child: MaterialButton(onPressed: () async {}),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
