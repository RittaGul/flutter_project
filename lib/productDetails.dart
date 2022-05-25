import 'package:flutter/material.dart';
import 'package:sampleproject/screens/homeScreen.dart';
import 'package:sampleproject/toolsUtilites.dart';

class ProductDetails extends StatefulWidget {
  String tagHero;
  final productDetailName;
  final productDetailPicture;
  final productDetailOldPrice;
  final productDetailNewPrice;

  ProductDetails(
      {required this.tagHero,
      required this.productDetailName,
      required this.productDetailPicture,
      required this.productDetailOldPrice,
      required this.productDetailNewPrice});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Hero(
            tag: widget.tagHero,
            child: Scaffold(
              // ////// APPBAAAAARRRRRR INFOOOOO
              appBar: AppBar(
                backgroundColor: Toolsutilites.mainColor,
                elevation: 0,
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(" ELBIYAFET ",
                      style: TextStyle(
                          color: Toolsutilites.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
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
                ],
              ),

              body: ListView(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: GridTile(
                      child: Container(
                        ////// PICTUREEEE INFOOOOOOO
                        color: Toolsutilites.whiteColor,
                        child: Image.asset(widget.productDetailPicture),
                      ),
                      footer: Container(
                        /////////////// اسم المنتج و السعر القديم والجديد//////
                        color: Colors.white70,
                        child: ListTile(
                          leading: Text(
                            widget.productDetailName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "tl  ${widget.productDetailOldPrice}",
                                  style: TextStyle(
                                      color: Toolsutilites.greyColor,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "tl  ${widget.productDetailNewPrice}",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /////////  اول بوتون   ////////
                  Row(
                    children: <Widget>[
                      /////////  البوتون تبع المقاس ////////

                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  ////////القائمة اللي بتطلع عند القياس /////
                                  return AlertDialog(
                                    title: Text("Size "),
                                    content: Text("Choose the Size "),
                                    actions: <Widget>[
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(context);
                                        },
                                        child: Text("close "),
                                      ),
                                    ],
                                  );
                                });
                          },
                          color: Toolsutilites.whiteColor,
                          textColor: Toolsutilites.greyColor,
                          elevation: 0.2,
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                child: Text("Size "),
                              ),
                              Expanded(
                                child: Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /////////البوتون تبع اللون ////////
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  ///////القائمة اللي بتطلع عند اللون////
                                  return AlertDialog(
                                    title: Text("Colors "),
                                    content: Text("Choose a Color "),
                                    actions: <Widget>[
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(context);
                                        },
                                        child: Text("close "),
                                      ),
                                    ],
                                  );
                                });
                          },
                          color: Toolsutilites.whiteColor,
                          textColor: Toolsutilites.greyColor,
                          elevation: 0.2,
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                child: Text(" Color"),
                              ),
                              Expanded(
                                child: Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /////////البوتون تبع الكمية  /////////
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  ////////القائمة اللي بتطلع عند الكمية///////
                                  return AlertDialog(
                                    title: Text("Quantity "),
                                    content: Text("Choose the quantity "),
                                    actions: <Widget>[
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(context);
                                        },
                                        child: Text("close "),
                                      ),
                                    ],
                                  );
                                });
                          },
                          color: Toolsutilites.whiteColor,
                          textColor: Toolsutilites.greyColor,
                          elevation: 0.2,
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                child: Text("Qty "),
                              ),
                              Expanded(
                                child: Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  /////////  اخر  بوتون   ////////

                  Row(
                    children: <Widget>[
                      /////////  البوتون تبع الشراء  ////////

                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          color: Toolsutilites.mainColor,
                          textColor: Toolsutilites.whiteColor,
                          elevation: 0.2,
                          child: Text("buy now "),
                        ),
                      ),
                      ///////الايقونات اللي جنب الشراء ////
                      IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Toolsutilites.mainColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Toolsutilites.mainColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Divider(),
                  ListTile(
                    /////تفاصيل المنتج //////////
                    title: Text("Product details "),
                    subtitle: Text(
                        " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "),
                  ),

                  Divider(),
                  Row(
                    ///////////اسم المنتج ///////
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                        child: Text(
                          "Product name ",
                          style: TextStyle(color: Toolsutilites.greyColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(widget.productDetailName),
                      ),
                    ],
                  ),
                  Row(
                    ///////////ماركة المنتج//////
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                        child: Text(
                          "product Brand ",
                          style: TextStyle(color: Toolsutilites.greyColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Brand x "),
                      ),
                    ],
                  ),
                  Row(
                    ///////////حالة المنتج ////////
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                        child: Text(
                          "product condition ",
                          style: TextStyle(color: Toolsutilites.greyColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text("NEW"),
                      ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Similar Products ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 360.0,
                    child: SimilarProd(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SimilarProd extends StatefulWidget {
  @override
  State<SimilarProd> createState() => _SimilarProdState();
}

class _SimilarProdState extends State<SimilarProd> {
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
  ];

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
          child: SimilarSingleProd(
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

class SimilarSingleProd extends StatelessWidget {
  final tagHero;
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodNewPrice;

  SimilarSingleProd(
      {required this.tagHero,
      required this.prodName,
      required this.prodPicture,
      required this.prodOldPrice,
      required this.prodNewPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Text(
                    "tl $prodNewPrice",
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
    );
  }
}
