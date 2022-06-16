import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/api/apiPage.dart';
import 'package:sampleproject/auth/AuthScreen.dart';
import 'package:sampleproject/drawerScreens/userCartScreen.dart';
import 'package:sampleproject/drawerScreens/userFavouritesScreen.dart';
import 'package:sampleproject/toolsUtilites.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawerScreens/AboutScreen.dart';

class DrawerPage extends StatefulWidget {
  var idKey;
  DrawerPage({this.idKey});
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      //كود ثابت هدول
      stream: FirebaseFirestore.instance
          .collection('/Users/${widget.idKey}/userInf/')
          .snapshots(),
      builder: ((context, snapshot) {
        print(widget.idKey);
        if (!snapshot.hasData) {
          //اذا البيانات فاضية يعمل انتظار
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        //كود ثابت
        List<DocumentSnapshot> s1 = snapshot.data!.docs;
        // '${(s1[0] as dynamic)['userName']}'
        return Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('${(s1[0] as dynamic)['userName']}'),
                accountEmail: Text('${(s1[0] as dynamic)['email']}'),
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
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => userFavouritesPage(
                        idKey: widget.idKey,
                      ),
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
              Divider(),
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
                    'About Us  ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.help,
                    color: Colors.blue,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () async {
                  SharedPreferences s1 = await SharedPreferences.getInstance();
                  s1.setBool('fetch', false);
                  s1.setString('key', '');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => AuthScreen())),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Sign Out  :( ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 65, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 45, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
