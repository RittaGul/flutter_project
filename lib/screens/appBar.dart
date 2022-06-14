import 'package:flutter/material.dart';
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
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Toolsutilites.whiteColor,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("usercartpage");
          },
        ),
      ],
    );
  }
}
