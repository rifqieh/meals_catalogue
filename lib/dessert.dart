import 'package:flutter/material.dart';
import 'detail-dessert.dart';
import 'nama.dart';
import 'gambar.dart';

class Dessert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10),
      itemCount: gambarDessert.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: GridTile(
            child: Container(
              child: Hero(
                tag: 'dessert$index',
                child: Image.network(gambarDessert[index]),
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(namaDessert[index]),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreenDessert(item: index)));
          },
        );
      },
    );
  }
}
