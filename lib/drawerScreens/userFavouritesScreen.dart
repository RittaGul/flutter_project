
import 'package:flutter/material.dart';
import 'package:sampleproject/toolsUtilites.dart';
class userFavouritesPage extends StatefulWidget {


  @override
  State<userFavouritesPage> createState() => _userFavouritesPageState();
}

class _userFavouritesPageState extends State<userFavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Toolsutilites.secondColor,
          child:Text(
            " i am  user Favourites Page ", style: TextStyle(
              fontSize: 30 ,color: Toolsutilites.whiteColor
          ),
          ),
        ),
      ),

    );
  }
}
