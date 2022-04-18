import 'package:dsproject1/intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const app_start());
}

class app_start extends StatelessWidget {
  const app_start({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const intro_page(),
    );
  }
}
