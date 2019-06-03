import 'package:flutter/material.dart';

class HomePageCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'assets/img/cat/1.jpg',
            imageTitle: 'ظروف مسی',
          ),
          Category(
            imageLocation: 'assets/img/cat/2.jpg',
            imageTitle: 'لوازم آشپزحانه',
          ),
          Category(
            imageLocation: 'assets/img/cat/3.jpg',
            imageTitle: 'سینی',
          ),
          Category(
            imageLocation: 'assets/img/cat/4.jpg',
            imageTitle: 'سرویس قابلمه',
          ),
          Category(
            imageLocation: 'assets/img/cat/5.jpg',
            imageTitle: 'چینی',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageTitle;

  Category({this.imageLocation, this.imageTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 120.0,
          child: ListTile(
            title: CircleAvatar(
              backgroundImage: AssetImage(imageLocation),
              radius: 42,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  imageTitle,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
          ),
        ),
      ),
    );
  }
}
