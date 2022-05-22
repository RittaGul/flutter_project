import 'package:flutter/material.dart';
import 'package:sampleproject/productDetails.dart';

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //المعلوماات
  var productList = [
    {
      'tagHero': '1.image',
      "name": "elbise",
      "picture": "assets/products/1.png",
      "old_price": 120,
      "new price": 85
    },
    {
      'tagHero': '2.image',
      "name": "elbise",
      "picture": "assets/products/2.png",
      "old_price": 120,
      "new price": 85
    },
    {
      'tagHero': '3.image',
      "name": "elbise",
      "picture": "assets/products/3.png",
      "old_price": 120,
      "new price": 85
    },
    {
      'tagHero': '4.image',
      "name": "elbise",
      "picture": "assets/products/4.png",
      "old_price": 150,
      "new price": 100
    },
    {
      'tagHero': '5.image',
      "name": "elbise",
      "picture": "assets/products/5.png",
      "old_price": 150,
      "new price": 100
    },
    {
      'tagHero': '6.image',
      "name": "elbise",
      "picture": "assets/products/6.png",
      "old_price": 150,
      "new price": 100
    },
    {
      'tagHero': '7.image',
      "name": "elbise",
      "picture": "assets/products/7.png",
      "old_price": 150,
      "new price": 100
    },
    {
      'tagHero': '8.image',
      "name": "elbise",
      "picture": "assets/products/8.png",
      "old_price": 150,
      "new price": 100
    },
    {
      'tagHero': '9.image',
      "name": "elbise",
      "picture": "assets/products/9.png",
      "old_price": 150,
      "new price": 100
    },
    {
      'tagHero': '10.image',
      "name": "elbise",
      "picture": "assets/products/10.png",
      "old_price": 150,
      "new price": 100
    },
    {
      'tagHero': '11.image',
      "name": "elbise",
      "picture": "assets/products/11.png",
      "old_price": 150,
      "new price": 100
    },
    {
      'tagHero': '12.image',
      "name": "elbise",
      "picture": "assets/products/12.png",
      "old_price": 150,
      "new price": 100
    },
  ];

//
//
//
//
//

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: productList.map((item) {
        return Padding(
          padding: const EdgeInsets.all(0),
          child: SingleProd(
            tagHero: item['tagHero'],
            prodName: item['name'],
            prodPicture: item['picture'],
            prodOldPrice: item['old_price'],
            prodNewPrice: item['new price'],
          ),
        );
      }).toList(),
    );
  }
}

class SingleProd extends StatelessWidget {
  final tagHero;
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodNewPrice;

  SingleProd(
      {required this.tagHero,
      required this.prodName,
      required this.prodPicture,
      required this.prodOldPrice,
      required this.prodNewPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: tagHero,
        child: Material(
          child: InkWell(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ProductDetails(
                        tagHero: tagHero,
                        productDetailName: prodName,
                        productDetailPicture: prodPicture,
                        productDetailOldPrice: prodOldPrice,
                        productDetailNewPrice: prodNewPrice,
                      )),
                ),
              );
            }),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        prodName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      "tl ${prodNewPrice}",
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              child: Image.asset(
                prodPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
