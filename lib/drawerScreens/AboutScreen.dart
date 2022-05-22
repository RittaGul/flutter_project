
import 'package:flutter/material.dart';
import 'package:sampleproject/toolsUtilites.dart';
class AboutPage extends StatefulWidget {


  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Toolsutilites.secondColor,
         child:Text(
           " i am  About Page ", style: TextStyle(
           fontSize: 30 ,color: Toolsutilites.whiteColor
         ),
         ),
        ),
      ),

    );
  }
}
