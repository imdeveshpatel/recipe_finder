
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_finder/core/model/recipe.dart';

class ApiService {
  static const String apiKey = 'd8fe24ab16ac49f0864e820a6de43c01';
  static const String baseUrl = 'https://api.spoonacular.com/recipes';

  Future<List<Recipe>> searchRecipes(String ingredients) async {
    try {
      final response = await http.get(Uri.parse(
          '$baseUrl/findByIngredients?ingredients=$ingredients&number=10&apiKey=$apiKey'));
      
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Recipe.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Error fetching recipes: ${e.toString()}');
    }
  }

  Future<RecipeDetail> getRecipeDetail(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id/information?apiKey=$apiKey'));
      
      if (response.statusCode == 200) {
        return RecipeDetail.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load recipe detail');
      }
    } catch (e) {
      throw Exception('Error fetching recipe detail: ${e.toString()}');
    }
  }
}

