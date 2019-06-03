import 'package:flutter/material.dart';
import 'package:my_shop/component/categories.dart';

import 'package:my_shop/component/image_carousel.dart';
import 'package:my_shop/component/products_list.dart';
import 'package:my_shop/pages/login_page.dart';
import 'package:my_shop/pages/shop_cart_page.dart';

class HomePage extends StatefulWidget {
  final String fullname;
  HomePage({this.fullname});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget sideDrawer = Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      shape: StadiumBorder(
                          side: BorderSide(width: 0.25, color: Colors.red)),
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.person),
                  ],
                ),
              )
            ],
            automaticallyImplyLeading: false,
            title: Text('Hello ${widget.fullname}'),
          ),
          ListTile(
            title: Text('ijmlml'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage())),
          ),
        ],
      ),
    );

    return Scaffold(
      drawer: sideDrawer,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopCardPage()));
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ImageCarousel(),
          Padding(
            padding: EdgeInsets.only(top: 4, left: 10, bottom: 4, right: 4),
            child: Text(
              'دسته‌بندی‌ها',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          HomePageCategory(),
          Padding(
            padding: EdgeInsets.only(top: 4, left: 10, bottom: 4, right: 4),
            child: Text(
              'محصولات جدید',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ProductsList(),
        ],
      ),
    );
  }
}
