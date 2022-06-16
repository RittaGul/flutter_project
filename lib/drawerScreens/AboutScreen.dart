import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:marquee/marquee.dart';
import 'package:sampleproject/toolsUtilites.dart';
import 'package:flutter/material.dart';

const email = "rittagul1@gmail.com";
const phone = "+90 552 693 69 50";
const adress = "Konya/Turkey";

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage("assets/avatar/profile.jpeg"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: DefaultTextStyle(
                style: TextStyle(
                    fontSize: 22,
                    color: Toolsutilites.mainColor,
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Ritta ',
                    ),
                    WavyAnimatedText('Gül'),
                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InfoCart(text: phone, icon: Icons.phone, onPressed: () {}),
            InfoCart(text: email, icon: Icons.email, onPressed: () {}),
            InfoCart(text: adress, icon: Icons.home, onPressed: () {}),
            SizedBox(
              height: 50,
              child: Marquee(
                text:
                    'Selcuk University Faculty of Technology Computer Engineering"',
                crossAxisAlignment: CrossAxisAlignment.end,
                style: TextStyle(fontSize: 16),
                fadingEdgeStartFraction: 0.2,
                fadingEdgeEndFraction: 0.2,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 2),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCart extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  InfoCart({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Toolsutilites.whiteColor,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal:19),
        child: ListTile(
          leading: Icon(icon, color: Toolsutilites.mainColor),
          title: Text(
            text,
            style: TextStyle(color: Toolsutilites.secondColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
