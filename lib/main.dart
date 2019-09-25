import 'package:flutter/material.dart';
import 'model/meal.dart';
import 'view/detail.dart';
import 'api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MealsCataloguePage(),
    );
  }
}

class MealsCataloguePage extends StatefulWidget {
  MealsCataloguePage({Key key}) : super(key: key);
  @override
  _MealsCataloguePageState createState() => _MealsCataloguePageState();
}

class _MealsCataloguePageState extends State<MealsCataloguePage> {
  List idDessert;
  List idSeafood;
  List<Meal> dessert = [];
  List<Meal> seafood = [];
  List<Meal> favorite = [];
  List<Meal> meals = [];
  List<Meal> filter = [];
  int _selectedIndex = 0;
  final _filter = TextEditingController();
  String searchText = '';
  bool _isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    List<Meal> des = await getData('dessert');
    List<Meal> sea = await getData('seafood');
    setState(() {
      dessert = des;
      seafood = sea;
    });
  }

  isFavorite(int id){
    setState(() {
     meals[id].isFavorite = !meals[id].isFavorite;
     if(meals[id].isFavorite == true){
       favorite.add(meals[id]);
     } else{
       favorite.removeWhere((meal){
         return meal.idMeal == meals[id].idMeal;
       });
     }
    });
  }

  filterData(String text){
    for(int i=0 ; i<filter.length ; i++){
      if(filter[i].strMeal.toLowerCase().contains(text.toLowerCase())) print(filter[i].strMeal);
    }
    setState(() {
      meals = filter.where((meal) => meal.strMeal.toLowerCase().contains(text.toLowerCase())).toList();
    });
  }

  getBody(int section) {
    if(_isSearch == false){
      if(section == 0){
        meals = dessert;
      } else if(section == 1){
        meals = seafood;
      } else{
        meals = favorite;
      }
      filter = meals;
    }

    if (dessert.length == 0 && seafood.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if(meals.length == 0){
      return Center(child: Text('Makanan tidak ditemukan.'),);
    } else {
      return getGridView(section);
    }
  }

  GridView getGridView(int section) {

    return GridView.builder(
      key: Key('long_list'),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10),
      itemCount: meals.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          key: Key('mealCard$index'),
          child: GridTile(
            child: Container(
              child: Hero(
                  tag: '${meals[index].idMeal}',
                  child: Image.network('${meals[index].strMealThumb}')),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(meals[index].strMeal, key: Key('item_${index}_text')),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetailPage(
                        meal: meals[index], index: index, isFavorite: isFavorite,)));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(
            color: Colors.white
          ),
          controller: _filter,
          onChanged: (text){
            print(text);
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'Cari Makanan',
            hintStyle: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              filterData(_filter.text);
              setState(() {
               _isSearch = true;
              });
              // print(_filter.text);
              // setState(() {
              //   meals = filterData(_filter.text);
              // });
              // print(meals);
            },
          )
        ],
      ),
      body: getBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              title: Text('Dessert', key: Key('fastfood'),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_dining),
              title: Text('Seafood'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorite'),
            )
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              _isSearch = false;
            });
          }),
    );
  }
}
