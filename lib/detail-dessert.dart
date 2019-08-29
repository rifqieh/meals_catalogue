import 'package:flutter/material.dart';
import 'nama.dart';
import 'gambar.dart';
import 'bahan.dart';
import 'cara.dart';

class DetailScreenDessert extends StatelessWidget {
  DetailScreenDessert({Key key, this.item}) : super(key: key);
  final item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaDessert[item]),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: 'dessert$item',
            child: Image.network(gambarDessert[item]),
          ),
          Center(
            child: Text(
              namaDessert[item],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(bahanDessert[item])),
          Container(
              padding: EdgeInsets.all(10), child: Text(caraDessert[item])),
        ],
      ),
    );
  }
}
