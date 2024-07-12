import 'package:http/http.dart' as http;
import 'dart:convert';
import 'meal_model.dart';

class MealRepository {
  final String apiUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<Meal>> fetchMeals() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> mealJson = jsonResponse['meals'];
      return mealJson.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
