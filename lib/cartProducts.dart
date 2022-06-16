import 'package:flutter/material.dart';
import 'package:sampleproject/toolsUtilites.dart';

class CartProducts extends StatefulWidget {
  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var ProductsOnTheCart = [
    {
      //'tagHero': '1.image',
      "name": "white dress",
      "picture": "assets/products/1.png",
      "new price": 250,
      "size": "7",
      "color": "white",
    },
    {
      //'tagHero': '2.image',
      "name": "red dress",
      "picture": "assets/products/2.png",
      "new price": 200,
      "size": "7",
      "color": "Red",
    },
    {
      //'tagHero': '13.image',
      "name": "white shirt",
      "picture": "assets/products/13.png",
      "new price": 299,
      "size": "7",
      "color": "white",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ProductsOnTheCart.length,
      itemBuilder: (context, index) {
        return SingleCartProd(
          //CartTagHero:[index],
          CartProdName: ProductsOnTheCart[index]["name"],
          CartProdPicture: ProductsOnTheCart[index]["picture"],
          CartProdNewPrice: ProductsOnTheCart[index]["new price"],
          CartProdSize: ProductsOnTheCart[index]["size"],
          CartProdColor: ProductsOnTheCart[index]["color"],
        );
      },
    );
  }
}

class SingleCartProd extends StatelessWidget {
  //final CartTagHero;
  final CartProdName;
  final CartProdPicture;
  final CartProdNewPrice;
  final CartProdSize;
  final CartProdColor;

  SingleCartProd({
    required this.CartProdName,
    required this.CartProdPicture,
    required this.CartProdNewPrice,
    required this.CartProdSize,
    required this.CartProdColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          CartProdPicture,
        ),
        title: Text(CartProdName),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
////هي للقياس ////
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    CartProdSize,
                    style: TextStyle(color: Toolsutilites.mainColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    CartProdColor,
                    style: TextStyle(color: Toolsutilites.mainColor),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                " tl ${CartProdNewPrice}",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
