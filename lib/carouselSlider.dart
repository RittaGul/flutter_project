import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imageList = [
  "assets/products/9.png",
  "assets/products/11.png",
  "assets/products/12.png",
  "assets/products/13.png",
  "assets/products/14.png",
  "assets/products/15.png",
  "assets/products/16.png",
];

Widget imageCarouselSlider = Container(
  child: CarouselSlider(
    options: CarouselOptions(
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
      autoPlay: true,
      autoPlayAnimationDuration: Duration(milliseconds: 500),
    ),
    //معلومات الليست تبع الصور
    items: imageList
        .map((e) => ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    e,
                    width: 800,
                    height: 80,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ))
        .toList(),
  ),
);
