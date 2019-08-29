import 'package:flutter/material.dart';
import 'breakfast.dart';
import 'dessert.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Makanan'),
      ),
      body: (_selectedIndex == 0) ? BreakFast() : Dessert(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service), title: Text('Breakfast')),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), title: Text('Dessert')),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
