import 'package:flutter/material.dart';
import 'package:sampleproject/api/apiPage.dart';
import 'package:sampleproject/drawerScreens/userAccountScreen.dart';
import 'package:sampleproject/drawerScreens/userCartScreen.dart';
import 'package:sampleproject/drawerScreens/userFavouritesScreen.dart';
import 'package:sampleproject/toolsUtilites.dart';
import 'drawerScreens/AboutScreen.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Ritta Gül'),
            accountEmail: Text('rittagul2@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Toolsutilites.yellowColor,
                child: Icon(
                  Icons.person,
                  color: Toolsutilites.whiteColor,
                  size: 40,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Toolsutilites.mainColor),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => userAccountPage(),
                ),
              );
            },
            child: ListTile(
              title: Text(
                'My account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.person),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => userCartPage(),
                ),
              );
            },
            child: ListTile(
              title: Text(
                'Shopping cart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.shopping_cart),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => userFavouritesPage(),
                ),
              );
            },
            child: ListTile(
              title: Text(
                'Favourites',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.favorite,
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => apiPage(),
                ),
              );
            },
            child: ListTile(
              title: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.shopping_basket),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
            child: ListTile(
              title: Text(
                'About Us :) ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 60, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
