
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
      "name": "elbise",
      "picture": "assets/products/1.png",
      "new price": 85,
      "size": "7",
      "color": "Red",
      "quantity": 1,
    },
    {
      //'tagHero': '2.image',
      "name": "elbise",
      "picture": "assets/products/2.png",
      "new price": 85,
      "size": "7",
      "color": "Red",
      "quantity": 2,
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
          CartProdqty: ProductsOnTheCart[index]["quantity"],
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
  final CartProdqty;
  SingleCartProd(
      {required this.CartProdName,
      required this.CartProdPicture,
      required this.CartProdNewPrice,
      required this.CartProdSize,
      required this.CartProdColor,
      required this.CartProdqty});

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
        trailing: SafeArea(top: true ,
          child:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
        ),
      ),
    );
  }
}
