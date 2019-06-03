import 'package:flutter/material.dart';
import 'package:my_shop/component/products_cart.dart';

class ShopCardPage extends StatefulWidget {
  @override
  _ShopCardPageState createState() => _ShopCardPageState();
}

class _ShopCardPageState extends State<ShopCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سبد خرید'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: ProductsCart(),
      bottomNavigationBar: Container(
        height: 45,
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'تومان' + '  125.500',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'قیمت کل',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
