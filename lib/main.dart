import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/screens/homeScreen.dart';
import 'package:sampleproject/screens/onBoardingScreen.dart';
import 'package:sampleproject/toolsUtilites.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elbiyafet Shop',
      theme: ThemeData(
        primaryColor: Toolsutilites.mainColor,
      ),
      //استدعيت الصفحات الرئيسية
      home: //HomePage(),
          // apiPage(),
          OnBoardingPage(),
    );
  }
}
