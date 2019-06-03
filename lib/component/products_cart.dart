import 'package:flutter/material.dart';

class ProductsCart extends StatefulWidget {
  @override
  _ProductsCartState createState() => _ProductsCartState();
}

class _ProductsCartState extends State<ProductsCart> {
  var productsOnCart = [
    {
      "name": "ظروف مسی",
      "image": "assets/img/cat/1.jpg",
      "price": 180000,
      "qty": 2,
    },
    {
      "name": "ظروف مسی",
      "image": "assets/img/cat/2.jpg",
      "price": 180000,
      "qty": 5,
    },
    {
      "name": "ظروف مسی",
      "image": "assets/img/cat/3.jpg",
      "price": 180000,
      "qty": 2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsOnCart.length,
      itemBuilder: (context, i) {
        return SingleProductCart(
          productName: productsOnCart[i]["name"],
          productImage: productsOnCart[i]["image"],
          productPrice: productsOnCart[i]["price"],
          productQty: productsOnCart[i]["qty"],
        );
      },
    );
  }
}

class SingleProductCart extends StatelessWidget {
  final productName;
  final productImage;
  final productPrice;
  final productQty;

  SingleProductCart(
      {this.productName,
      this.productImage,
      this.productPrice,
      this.productQty});
  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: ListTile(
        leading: Image.asset(
          productImage,
          width: 70,
        ),
        title: Text(productName,style: TextStyle(
            fontWeight: FontWeight.bold,
        ),),
        subtitle: Text(
          '$productPrice',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          fontSize: 20),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 25,bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){},),
              Text('$productQty'),
              IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
