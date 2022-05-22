import 'package:flutter/material.dart';

import '../drawerScreens/userCartScreen.dart';
import '../toolsUtilites.dart';

class AppBarPiece extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Toolsutilites.mainColor,
      elevation: 0,
      title: Text(
        " ELBIYAFET ",
        style: TextStyle(
            color: Toolsutilites.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        //البوتونات اللي بالاب بار
        IconButton(
          icon: Icon(
            Icons.search,
            color: Toolsutilites.whiteColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Toolsutilites.whiteColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => userCartPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
