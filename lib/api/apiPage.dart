// import 'dart:async';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sampleproject/api/Items.dart';
import 'package:sampleproject/api/fetch.dart';
import 'package:sampleproject/toolsUtilites.dart';

class apiPage extends StatefulWidget {
  @override
  State<apiPage> createState() => _apiPage();
}

class _apiPage extends State<apiPage> {
  @override
  void initState() {
    /////////// هي اللي بتجيب الرابط
    getInfByApi();
    Future.delayed(Duration.zero, (() => getInfByApi()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 20),
      child: FutureBuilder(

          ///لحتى تستقبل متغيرين مستقبل و بيولدر بعدا المستقبل فيها الدالة تبع البيانات
          future: getInfByApi(),
          builder: (context, snapshot) {
            //اذا مليانة يطبع هدول
            return !getItemsByApi.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        NewContainer(
                          ContainerImage: getItemsByApi[0].image,
                          ContainerTitle: getItemsByApi[0].title,
                          ContainerPrice: getItemsByApi[0].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[1].image,
                          ContainerTitle: getItemsByApi[1].title,
                          ContainerPrice: getItemsByApi[1].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[2].image,
                          ContainerTitle: getItemsByApi[2].title,
                          ContainerPrice: getItemsByApi[2].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[3].image,
                          ContainerTitle: getItemsByApi[3].title,
                          ContainerPrice: getItemsByApi[3].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[4].image,
                          ContainerTitle: getItemsByApi[4].title,
                          ContainerPrice: getItemsByApi[4].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[5].image,
                          ContainerTitle: getItemsByApi[5].title,
                          ContainerPrice: getItemsByApi[5].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[6].image,
                          ContainerTitle: getItemsByApi[6].title,
                          ContainerPrice: getItemsByApi[6].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[7].image,
                          ContainerTitle: getItemsByApi[7].title,
                          ContainerPrice: getItemsByApi[7].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[8].image,
                          ContainerTitle: getItemsByApi[8].title,
                          ContainerPrice: getItemsByApi[8].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[9].image,
                          ContainerTitle: getItemsByApi[9].title,
                          ContainerPrice: getItemsByApi[9].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[10].image,
                          ContainerTitle: getItemsByApi[10].title,
                          ContainerPrice: getItemsByApi[10].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[11].image,
                          ContainerTitle: getItemsByApi[11].title,
                          ContainerPrice: getItemsByApi[11].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[12].image,
                          ContainerTitle: getItemsByApi[12].title,
                          ContainerPrice: getItemsByApi[12].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[13].image,
                          ContainerTitle: getItemsByApi[13].title,
                          ContainerPrice: getItemsByApi[13].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[14].image,
                          ContainerTitle: getItemsByApi[14].title,
                          ContainerPrice: getItemsByApi[14].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[15].image,
                          ContainerTitle: getItemsByApi[15].title,
                          ContainerPrice: getItemsByApi[15].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[16].image,
                          ContainerTitle: getItemsByApi[16].title,
                          ContainerPrice: getItemsByApi[16].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[17].image,
                          ContainerTitle: getItemsByApi[17].title,
                          ContainerPrice: getItemsByApi[17].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[18].image,
                          ContainerTitle: getItemsByApi[18].title,
                          ContainerPrice: getItemsByApi[18].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[18].image,
                          ContainerTitle: getItemsByApi[18].title,
                          ContainerPrice: getItemsByApi[18].price,
                        ),
                        NewContainer(
                          ContainerImage: getItemsByApi[19].image,
                          ContainerTitle: getItemsByApi[19].title,
                          ContainerPrice: getItemsByApi[19].price,
                        ),
                      ],
                    ),
                  )
                //دالة الانتظار اذا كانت فاضية
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    ));
  }
}

class NewContainer extends StatelessWidget {
  NewContainer({
    required this.ContainerImage,
    required this.ContainerTitle,
    required this.ContainerPrice,
  });
  String ContainerImage;
  String ContainerTitle;
  var ContainerPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Toolsutilites.mainColor,
      ),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 130,
                width: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Image.network(ContainerImage),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(0, 40),
            child: Text(
              '${ContainerTitle}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 40),
            child: Text(
              'tl ${ContainerPrice}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
