import 'package:dsproject1/intro.dart';
import 'package:dsproject1/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_service.dart';
import 'dataservice.dart';
import 'mainpage.dart';
import 'onboarding.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위함
  await Firebase.initializeApp(); // firebase 앱 시작
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => dataService()),
      ],
      child: const app_start(),
    ),
  );
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.apartment_outlined,
          size: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}

// class app_start extends StatelessWidget {
//   const app_start({Key? key}) : super(key: key);

//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     final user = context.read<AuthService>().currentUser();
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: onboarding_page(),
//       // home: user == null ? LoginPage() : main_page(),
//     );
//   }
// }

class app_start extends StatelessWidget {
  const app_start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOnboarded = prefs.getBool("isOnboarded") ?? false;
    final user = context.read<AuthService>().currentUser();
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(textTheme: GoogleFonts.getTextTheme('Jua')),
            home: isOnboarded ? main_page() : onboarding_page(),
            // home: user == null ? LoginPage() : main_page(),
          );
        }
      },
    );
  }
}
