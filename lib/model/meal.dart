class Meal {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  bool isFavorite;

  Meal(
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.isFavorite
  );

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      json['idMeal'],
      json['strMeal'],
      json['strMealThumb'],
      json['strCategory'],
      json['strArea'],
      json['strInstructions'],
      false
    );
  }
}
