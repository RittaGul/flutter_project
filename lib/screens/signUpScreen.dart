
import 'package:flutter/material.dart';
import '../sizedBox.dart';
import '../toolsUtilites.dart';
import 'accountScreen.dart';

String? appBarText;

class SignUpPage extends StatefulWidget {


  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SIGN UP ",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Toolsutilites.mainColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Toolsutilites.mainColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: 350,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Toolsutilites.greyColor,
                    ),
                    hintText: "User Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            sortSizedBox(),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: 350,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Toolsutilites.greyColor,
                    ),
                    hintText: "Your Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            sortSizedBox(),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: 350,
                height: 40,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Toolsutilites.greyColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Toolsutilites.greyColor,
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            sortSizedBox(),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: 350,
                height: 40,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Toolsutilites.greyColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Toolsutilites.greyColor,
                    ),
                    hintText: "confirm your  Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            middleSizedBox(),
            Material(
              color: Toolsutilites.greyColor,
              borderRadius: BorderRadius.circular(35),
              child: InkWell(
                hoverColor: Toolsutilites.whiteColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 175,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 20,
                        color: Color(0xFF666666).withOpacity(.11),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
