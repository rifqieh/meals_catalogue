import 'package:flutter/material.dart';
import 'nama.dart';
import 'gambar.dart';
import 'bahan.dart';
import 'cara.dart';

class DetailScreenBreakFast extends StatelessWidget {
  DetailScreenBreakFast({Key key, this.item}) : super(key: key);
  final item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaBreakfast[item]),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: 'breakfast$item',
            child: Image.network(gambarBreakfast[item]),
          ),
          Center(
            child: Text(
              namaBreakfast[item],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(bahanBreakfast[item])),
          Container(
              padding: EdgeInsets.all(10), child: Text(caraBreakFast[item])),
        ],
      ),
    );
  }
}
