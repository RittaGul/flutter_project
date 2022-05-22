
import 'package:flutter/material.dart';
import 'package:sampleproject/toolsUtilites.dart';
class userAccountPage extends StatefulWidget {


  @override
  State<userAccountPage> createState() => _userAccountPageState();
}

class _userAccountPageState extends State<userAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Toolsutilites.secondColor,
          child:Text(
            " i am user Account Page", style: TextStyle(
              fontSize: 30 ,color: Toolsutilites.whiteColor
          ),
          ),
        ),
      ),

    );
  }
}
