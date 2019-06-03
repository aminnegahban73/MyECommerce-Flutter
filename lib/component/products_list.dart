import 'package:flutter/material.dart';

import 'package:my_shop/pages/product_details.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  var productsList = [
    {
      "name": "ظروف مسی",
      "image": "assets/img/cat/1.jpg",
      "price": 180000,
      "old_price": 195000
    },
    {
      "name": "آبمیوه گیری",
      "image": "assets/img/cat/2.jpg",
      "price": 1260000,
      "old_price": 1500000
    },
    {
      "name": "سینی",
      "image": "assets/img/cat/3.jpg",
      "price": 148000,
      "old_price": 163000
    },
    {
      "name": "سرویس 10 پارچه",
      "image": "assets/img/cat/4.jpg",
      "price": 630000,
      "old_price": 610000
    },
    {
      "name": "سرویس 10 پارچه",
      "image": "assets/img/cat/4.jpg",
      "price": 630000,
      "old_price": 610000
    },
    {
      "name": "سرویس 10 پارچه",
      "image": "assets/img/cat/4.jpg",
      "price": 630000,
      "old_price": 610000
    },
    {
      "name": "سرویس 10 پارچه",
      "image": "assets/img/cat/4.jpg",
      "price": 630000,
      "old_price": 610000
    },
    {
      "name": "سرویس 10 پارچه",
      "image": "assets/img/cat/4.jpg",
      "price": 630000,
      "old_price": 610000
    },
  ];

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return _SingleProduct(
          prodName: productsList[index]['name'],
          prodImage: productsList[index]['image'],
          prodPrice: productsList[index]['price'],
          prodOldPrice: productsList[index]['old_price'],
        );
      },
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}

class _SingleProduct extends StatelessWidget {
  final prodName;
  final prodImage;
  final prodPrice;
  final prodOldPrice;
  _SingleProduct(
      {this.prodName, this.prodImage, this.prodPrice, this.prodOldPrice});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsPage(
            prodDetailsName: prodName,
            prodDetailsImage: prodImage,
            prodDetailsPrice: prodPrice,
            prodDetailsOldPrice: prodOldPrice,
          )));
        },
        child: GridTile(
          footer: Container(
            color: Colors.white70,
            child: ListTile(
              leading: Text(
                prodName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: Image.asset(prodImage,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
