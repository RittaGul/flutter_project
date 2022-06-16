import 'package:flutter/material.dart';
import 'package:sampleproject/Database/dataInf.dart';
import 'package:sampleproject/productDetails.dart';

class Products extends StatefulWidget {
  String idKey;
  Products({required this.idKey});
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //المعلوماات

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
            idKey: widget.idKey,
            id: item['id'],
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
  final idKey;
  final id;
  final tagHero;
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodNewPrice;

  SingleProd(
      {required this.idKey,
      required this.id,
      required this.tagHero,
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
                        idKey: idKey,
                        id: id,
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
                color: Colors.white24,
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
