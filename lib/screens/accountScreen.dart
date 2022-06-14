import 'package:flutter/material.dart';
import 'package:sampleproject/sizedBox.dart';
import 'package:sampleproject/toolsUtilites.dart';
import 'package:sampleproject/auth/AuthScreen.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Toolsutilites.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Join With Us Now ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Toolsutilites.mainColor,
                  ),
                ),
              ],
            ),
            longSizedBox(),
            MyButton(
              color: Toolsutilites.mainColor,
              title: "Log In ",
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("login");
              },
            ),
            MyButton(
              color: Toolsutilites.mainColor,
              title: " Sign Up ",
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("signup");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onPressed});
  final Color color;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
          elevation: 5,
          color: color,
          borderRadius: BorderRadius.circular(5),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 170,
            height: 50,
            child: Text(
              title,
              style: TextStyle(
                  color: Toolsutilites.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )),
    );
  }
}
