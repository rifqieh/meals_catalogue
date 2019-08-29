import 'package:flutter/material.dart';
import 'detail-breakfast.dart';
import 'nama.dart';
import 'gambar.dart';

class BreakFast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10),
      itemCount: gambarBreakfast.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: GridTile(
            child: Container(
              child: Hero(
                tag: 'breakfast$index',
                child: Image.network(gambarBreakfast[index]),
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black26,
              title: Text(namaBreakfast[index]),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreenBreakFast(item: index)));
          },
        );
      },
    );
  }
}
