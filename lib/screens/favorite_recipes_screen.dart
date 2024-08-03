import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/controllers/recipe_controller.dart';
import 'package:recipe_finder/screens/recipe_detail_screen.dart';
import 'package:animations/animations.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  final RecipeController controller = Get.find();

   FavoriteRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
      ),
      body: Obx(() {
        if (controller.favoriteRecipes.isEmpty) {
          return const Center(child: Text('No favorite recipes'));
        } else {
          return ListView.builder(
            itemCount: controller.favoriteRecipes.length,
            itemBuilder: (context, index) {
              final recipe = controller.favoriteRecipes[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: OpenContainer(
                  closedElevation: 0,
                  openElevation: 4,
                  closedBuilder: (context, openContainer) => ListTile(
                    leading: Hero(
                      tag: 'recipe_image_${recipe.id}',
                      child: Image.network(recipe.image),
                    ),
                    title: Text(recipe.title),
                    onTap: openContainer,
                  ),
                  openBuilder: (context, closeContainer) =>
                      RecipeDetailScreen(recipeId: recipe.id),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
