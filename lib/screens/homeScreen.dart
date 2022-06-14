import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../carouselSlider.dart';
import '../drawerScreen.dart';
import '../products.dart';
import '../toolsUtilites.dart';
import 'appBar.dart';

class HomePage extends StatefulWidget {
  var IdKey;
  HomePage({this.IdKey});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBarPiece(),
      ),
      drawer: ClipPath(
        clipper: OvalRightBorderClipper(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: BoxDecoration(color: Toolsutilites.whiteColor),
          width: 280,
          height: double.infinity,
          child: DrawerPage(
            idKey: widget.IdKey,
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          //الليست اللي بتتحرك لحالها
          imageCarouselSlider,
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'products',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Toolsutilites.yellowColor),
            ),
          ),
          Container(
            height: 420,
            child: Products(idKey: widget.IdKey),
          ),
        ],
      ),
    );
  }
}
