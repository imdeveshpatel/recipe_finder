import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/controllers/recipe_controller.dart';
import 'package:recipe_finder/screens/recipe_detail_screen.dart';
import 'package:animations/animations.dart';

class RecipeListScreen extends StatelessWidget {
  
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.recipes.isEmpty) {
          return const Center(child: Text('No recipes found'));
        } else {
          return ListView.builder(
            itemCount: controller.recipes.length,
            itemBuilder: (context, index) {
              final recipe = controller.recipes[index];
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
