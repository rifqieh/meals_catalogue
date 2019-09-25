import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/meal.dart';

class MealDetailPage extends StatefulWidget {
  final Meal meal;
  final int index;
  final Function isFavorite;

  MealDetailPage({Key key, this.meal, this.index, this.isFavorite}) : super(key: key);

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.meal.strMeal}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: widget.meal.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        onPressed: (){
          setState(() {
           widget.isFavorite(widget.index);
           print(widget.meal.isFavorite); 
          });
        },
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: '${widget.meal.idMeal}',
            child: Image.network('${widget.meal.strMealThumb}'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                '${widget.meal.strMeal}',
                key: Key('strMeal'),
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text('Category: ${widget.meal.strCategory}')),
          Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text('Area: ${widget.meal.strArea}')),
          Container(
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
              child: Text('Instruction: \n${widget.meal.strInstructions}')),
        ],
      ),
    );
  }
}
