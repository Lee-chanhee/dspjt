import 'package:dsproject1/loginpage.dart';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onboarding_page extends StatelessWidget {
  const onboarding_page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: onboarding_page(),
//     );
//   }
// }

  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        //page1
        PageViewModel(
            title: "Datastore",
            body: "우리는 데이터를 간편하게 거래하는 마켓이에요.",
            image: Padding(
              padding: EdgeInsets.all(32),
              child: Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
            ),
            decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                bodyTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ))),
        //page2

        PageViewModel(
            title: "Datastore",
            body: "우리는 데이터를 간편하게 거래하는 마켓이에요.",
            image: Padding(
              padding: EdgeInsets.all(32),
              child: Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
            ),
            decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                bodyTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ))),
        //page3

        PageViewModel(
            title: "Datastore",
            body: "우리는 데이터를 간편하게 거래하는 마켓이에요.",
            image: Padding(
              padding: EdgeInsets.all(32),
              child: Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
            ),
            decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                bodyTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ))),
        //page4

        PageViewModel(
            title: "Datastore",
            body: "우리는 데이터를 간편하게 거래하는 마켓이에요.",
            image: Padding(
              padding: EdgeInsets.all(32),
              child: Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
            ),
            decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                bodyTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ))),
      ],
      next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
      done: Text("Start Now", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        //When done button is press
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => main_page()),
        );
      },
    ));
  }
}
