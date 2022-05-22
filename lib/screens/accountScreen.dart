
import '../sizedBox.dart';
import '../toolsUtilites.dart';
import 'logInScreen.dart';
import 'signUpScreen.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Toolsutilites.mainColor),
        child: Column(
          //لحتى نحط كل النصوص بالنص
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              //معلومات النص اللي عند الصفحة الرئيسية
              "Join With Us Now ",

              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Toolsutilites.whiteColor,
              ),
            ),
            //المسافة بين النص و اول بوتون
            longSizedBox(),

            Material(
              // بوتون اللوغ ان لونه وتصميمه
              color: Toolsutilites.whiteColor,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                //الدالة اللي بتاخد ع غير صفحة
                hoverColor: Toolsutilites.secondColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInPage()),
                  );
                },
                //ستايلات البوتون الاول
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 175,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      // الوان الشادو تبع البوتون الاول
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 20,
                        color:
                        Color.fromARGB(255, 183, 183, 183).withOpacity(.11),
                      )
                    ],
                  ),
                  //معلومات النص بالبوتون
                  alignment: Alignment.center,
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff8f8f8f),
                    ),
                  ),
                ),
              ),
            ),
            //الفرق بين البوتونين
            SizedBox(
              height: 40,
            ),
            Material(
              //معلومات البوتون التاني
              color: Toolsutilites.whiteColor,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                hoverColor: Toolsutilites.secondColor,
                onTap: () {
                  Navigator.push(
                    //التحويل للصفحة الثانية
                    context,
                    MaterialPageRoute(builder: (context) =>  SignUpPage()),
                  );
                },
                //ستايل البوتون
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 175,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 20,
                        //اللون عند الضغط عالبوتون
                        color:
                        Color.fromARGB(255, 183, 183, 183).withOpacity(.11),
                      )
                    ],
                  ),
                  //معلومات النص الثاني
                  alignment: Alignment.center,
                  child: const Text(
                    "sign up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8f8f8f),
                    ),
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
