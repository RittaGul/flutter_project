import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/screens/homeScreen.dart';
import 'package:sampleproject/toolsUtilites.dart';

class ProductDetails extends StatefulWidget {
  final idKey;
  final id;
  String tagHero;
  final productDetailName;
  final productDetailPicture;
  final productDetailOldPrice;
  final productDetailNewPrice;

  ProductDetails(
      {required this.id,
      required this.idKey,
      required this.tagHero,
      required this.productDetailName,
      required this.productDetailPicture,
      required this.productDetailOldPrice,
      required this.productDetailNewPrice});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    print('=========== ${widget.idKey}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('/Users/${widget.idKey}/favorite')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<DocumentSnapshot> s1 = snapshot.data!.docs;
        return Column(
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: widget.tagHero,
                child: Scaffold(
                  // ////// APPBAAAAARRRRRR INFOOOOO
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Toolsutilites.mainColor,
                    elevation: 0,
                    title: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(IdKey: widget.idKey),
                          ),
                        );
                      },
                      child: Text(" ELBIYAFET ",
                          style: TextStyle(
                              color: Toolsutilites.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              title: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "tl  ${widget.productDetailOldPrice}",
                                      style: TextStyle(
                                          color: Toolsutilites.greyColor,
                                          decoration:
                                              TextDecoration.lineThrough),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /////////  البوتون تبع الشراء  ////////

                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("usercartpage");
                              },
                              color: Toolsutilites.mainColor,
                              textColor: Toolsutilites.whiteColor,
                              elevation: 0.2,
                              child: Text("buy now "),
                            ),
                          ),

                          Center(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      if (s1[widget.id]['id'] !=
                                          widget.id.toString()) {
                                        FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc('${widget.idKey}')
                                            .collection('favorite')
                                            .doc('${widget.id}')
                                            .set({'id': '${widget.id}'});
                                      } else {
                                        FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc('${widget.idKey}')
                                            .collection('favorite')
                                            .doc('${widget.id}')
                                            .set({'id': ''});
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 40,
                                    color: s1[widget.id]['id'] ==
                                            widget.id.toString()
                                        ? Colors.red
                                        : Toolsutilites.greyColor,
                                  ),
                                ),
                                AnimatedOpacity(
                                  opacity: (s1[widget.id] as dynamic)['id'] ==
                                          widget.id.toString()
                                      ? 0
                                      : 1,
                                  duration: Duration(milliseconds: 300),
                                  child: Text(
                                    'Add to favorite',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ///////////مكان النص
                                Transform.translate(
                                  offset: Offset(0, -15),
                                  child: AnimatedOpacity(
                                    opacity: (s1[widget.id] as dynamic)['id'] ==
                                            widget.id.toString()
                                        ? 1
                                        : 0,
                                    ////////////الوقت لبين ما يتغير النص
                                    duration: Duration(milliseconds: 1000),
                                    child: Text(
                                      'Added',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      ListTile(
                        /////تفاصيل المنتج //////////
                        title: Text("Product details "),
                        subtitle: Text(
                            " Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Similar Products ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 360.0,
                        child: SimilarProd(
                          idKey: widget.idKey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SimilarProd extends StatefulWidget {
  final idKey;
  SimilarProd({required this.idKey});
  @override
  State<SimilarProd> createState() => _SimilarProdState();
}

class _SimilarProdState extends State<SimilarProd> {
  var productList = [
    {
      'id': 8,
      'tagHero': '15.image',
      "name": "White dress",
      "picture": "assets/products/15.png",
      "old_price": 300,
      "new price": 250
    },
    {
      'id': 7,
      'tagHero': '2.image',
      "name": "red dress",
      "picture": "assets/products/2.png",
      "old_price": 250,
      "new price": 200
    },
    {
      'id': 6,
      'tagHero': '3.image',
      "name": "Three-piece dress",
      "picture": "assets/products/3.png",
      "old_price": 350,
      "new price": 300
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
            idkey: widget.idKey,
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

class SimilarSingleProd extends StatelessWidget {
  final idkey;
  final id;
  final tagHero;
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodNewPrice;

  SimilarSingleProd(
      {required this.tagHero,
      required this.idkey,
      required this.id,
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
                      idKey: idkey,
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
