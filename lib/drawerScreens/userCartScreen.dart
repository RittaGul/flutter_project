import 'package:flutter/material.dart';
import 'package:sampleproject/cartProducts.dart';
import 'package:sampleproject/toolsUtilites.dart';

class userCartPage extends StatefulWidget {
  @override
  State<userCartPage> createState() => _userCartPageState();
}

class _userCartPageState extends State<userCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Toolsutilites.mainColor,
        elevation: 0,
        title: Text(
          " Cart  ",
          style: TextStyle(
              color: Toolsutilites.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: Toolsutilites.whiteColor,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total :"),
                subtitle: Text("500 tl"),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Check out ",
                  style: TextStyle(color: Colors.white),
                ),
                color: Toolsutilites.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
