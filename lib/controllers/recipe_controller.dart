import 'package:get/get.dart';
import 'package:recipe_finder/core/model/recipe.dart';
import 'package:recipe_finder/core/services/api_service.dart';

class RecipeController extends GetxController {
  var recipes = <Recipe>[].obs;
  var favoriteRecipes = <Recipe>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final ApiService _service = ApiService();

  void searchRecipes(String ingredients) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      var results = await _service.searchRecipes(ingredients);
      recipes.assignAll(results);
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void addFavoriteRecipe(Recipe recipe) {
    if (!favoriteRecipes.any((r) => r.id == recipe.id)) {
      favoriteRecipes.add(recipe);
    }
  }

  void removeFavoriteRecipe(Recipe recipe) {
    favoriteRecipes.removeWhere((r) => r.id == recipe.id);
  }
    bool isFavorite(int recipeId) {
    return favoriteRecipes.any((r) => r.id == recipeId);
  }
}


