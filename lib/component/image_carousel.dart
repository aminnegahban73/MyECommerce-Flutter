import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 200.0,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('assets/img/cat/1.jpg'),
            AssetImage('assets/img/cat/2.jpg'),
            AssetImage('assets/img/cat/3.jpg'),
            AssetImage('assets/img/cat/4.jpg'),
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(seconds: 1),
          indicatorBgPadding: 7,
          autoplayDuration: Duration(seconds: 2),
          
        ));
  }
}
