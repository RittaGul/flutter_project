import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/Database/dataInf.dart';
import 'package:sampleproject/toolsUtilites.dart';
import '../products.dart';

class userFavouritesPage extends StatefulWidget {
  final idKey;
  userFavouritesPage({required this.idKey});
  @override
  State<userFavouritesPage> createState() => _userFavouritesPageState();
}

class _userFavouritesPageState extends State<userFavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('/Users/${widget.idKey}/favorite')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Transform.translate(
              offset: Offset(0, -130),
              child: Text(
                'No Items',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }
        var newItem = [];
        var s2 = snapshot.data!.docs;

        for (int i = 0; i < s2.length; i++) {
          if (s2[i]['id'] != '') {
            newItem.add(s2[i]['id']);
          }
        }
        return ListView.builder(
          itemCount: newItem.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  ///
                  ////
                  ////
                  ////
                },
                child: Card(
                  color: Colors.blue,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Toolsutilites.mainColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                  productList[int.parse(newItem[index])]
                                      ['picture'] as String,
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Text(
                                        '${productList[int.parse(newItem[index])]['name']}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${productList[int.parse(newItem[index])]['new price']}', ////
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    ));
  }
}
