import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meals_catalogue/model/meal.dart';

Future<Meal> getDessert(http.Client client) async {
  final response =
  await client.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert');
 
  if (response.statusCode == 200) {
    // Jika pemanggilan API berhasil, parse JSON.
    return Meal.fromJson(json.decode(response.body));
  } else {
    // Jika gagal, munculkan error.
    throw Exception('failed to load data');
  }
}

Future<Meal> getSeafood(http.Client client) async {
  final response =
  await client.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood');
 
  if (response.statusCode == 200) {
    // Jika pemanggilan API berhasil, parse JSON.
    return Meal.fromJson(json.decode(response.body));
  } else {
    // Jika gagal, munculkan error.
    throw Exception('failed to load data');
  }
}

Future<Meal> getDetailMeal(http.Client client) async {
  final response =
  await client.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52893');
 
  if (response.statusCode == 200) {
    // Jika pemanggilan API berhasil, parse JSON.
    return Meal.fromJson(json.decode(response.body));
  } else {
    // Jika gagal, munculkan error.
    throw Exception('failed to load data');
  }
}

Future<List<Meal>> getData(String dataType) async {
  List<Meal> meals = [];
  http.Response response;

  String url = (dataType == 'dessert')
      ? 'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert'
      : 'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood';

  response = await http.get(url);

  var responseJson = jsonDecode(response.body);

  if (response.statusCode == 200) {
    for (int i = 0; i < responseJson['meals'].length; i++) {
      String id = responseJson['meals'][i]['idMeal'];
      meals.add(await getDetail(id));
    }
  } else {
    throw Exception('Failed to load data');
  }

  return meals;
}

Future<Meal> getDetail(String id) async {
  http.Response response = await http
      .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
  Map<String, dynamic> map = jsonDecode(response.body);
  String idMeal = map['meals'][0]['idMeal'];
  String strMeal = map['meals'][0]['strMeal'];
  String strMealThumb = map['meals'][0]['strMealThumb'];
  String strCategory = map['meals'][0]['strCategory'];
  String strArea = map['meals'][0]['strArea'];
  String strInstructions = map['meals'][0]['strInstructions'];
  return Meal(
      idMeal, strMeal, strMealThumb, strCategory, strArea, strInstructions, false);
}
