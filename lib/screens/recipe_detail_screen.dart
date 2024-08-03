import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/controllers/recipe_controller.dart';
import 'package:recipe_finder/core/model/recipe.dart';
import 'package:recipe_finder/core/services/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int recipeId;
  final ApiService _service = ApiService();
  final RecipeController controller = Get.find();

  RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecipeDetail>(
      future: _service.getRecipeDetail(recipeId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Recipe Detail'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Recipe Detail'),
            ),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          final recipe = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(recipe.title),
              actions: [
                Obx(() {
                  bool isFavorite = controller.isFavorite(recipe.id);
                  return Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                        onPressed: () {
                          if (isFavorite) {
                            controller.removeFavoriteRecipe(Recipe(
                              id: recipe.id,
                              title: recipe.title,
                              image: recipe.image,
                            ));
                          } else {
                            controller.addFavoriteRecipe(Recipe(
                              id: recipe.id,
                              title: recipe.title,
                              image: recipe.image,
                            ));
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.black),
                        onPressed: () {
                          final String shareContent =
                              'Check out this recipe: ${recipe.title}\n${recipe.instructions}';
                          Share.share(shareContent);
                        },
                      ),
                    ],
                  );
                }),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'recipe_image_${recipe.id}',
                      child: CachedNetworkImage(
                        imageUrl: recipe.image,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Ingredients:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ...recipe.extendedIngredients.map((ingredient) => Text(
                        '${ingredient.amount} ${ingredient.unit} ${ingredient.name}')),
                    const SizedBox(height: 16),
                    const Text(
                      'Instructions:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(recipe.instructions),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
