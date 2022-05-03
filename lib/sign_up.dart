import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_service.dart';
import 'loginpage.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20);
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
        appBar: AppBar(automaticallyImplyLeading: true, title: Text("회원가입")),
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
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    inputFormatters: [
                      MaskTextInputFormatter(
                          mask: '###-###-####',
                          filter: {"#": RegExp(r'[0-12]')},
                          type: MaskAutoCompletionType.lazy)
                    ],
                    controller: phoneNoController,
                    validator: (value) =>
                        (value!.isEmpty) ? "비밀번호를 확인해주세요" : null,
                    // style: style,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_iphone),
                        labelText: "휴대폰 본인 인증",
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
