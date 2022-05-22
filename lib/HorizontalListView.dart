import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'assets/CategoryImages/tshirt.png',
            imageCaption: 'shirt',
          ),
          Category(
            imageLocation: 'assets/CategoryImages/jeans.png',
            imageCaption: 'jeans',
          ),
          Category(
            imageLocation: 'assets/CategoryImages/informal.png',
            imageCaption: 'informal',
          ),
          Category(
            imageLocation: 'assets/CategoryImages/formal.png',
            imageCaption: 'formal',
          ),
          Category(
            imageLocation: 'assets/CategoryImages/dress.png',
            imageCaption: 'dress',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  Category({Key? key, this.imageLocation, this.imageCaption}) : super(key: key);
  String? imageLocation;
  String? imageCaption;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imageLocation!,
              width: 50,
              height: 40,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imageCaption!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
