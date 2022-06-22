import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/auth/AuthScreen.dart';
import 'package:sampleproject/auth/auth.dart';
import 'package:sampleproject/drawerScreens/userCartScreen.dart';
import 'package:sampleproject/screens/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

var islogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences a1 = await SharedPreferences.getInstance();
  var idKey = a1.getString('key');
  var fetch = a1.getBool('fetch') == null ? false : a1.getBool('fetch');
  runApp(newApp1(IdKey: idKey, fetch: fetch));
}

class newApp1 extends StatefulWidget {
  var IdKey;
  var fetch;
  newApp1({required this.IdKey, required this.fetch});

  @override
  State<newApp1> createState() => _newApp1State();
}

class _newApp1State extends State<newApp1> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Auth>(
            create: ((context) => Auth()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              // scaffoldBackgroundColor: Colors.white,
              // primarySwatch: Colors.blue,
              ),
          home: this.widget.fetch == false
              ? AuthScreen()
              : HomePage(
                  IdKey: this.widget.IdKey,
                ),
          routes: {
            "usercartpage": (context) => userCartPage(),
          },
        ));
  }
}
