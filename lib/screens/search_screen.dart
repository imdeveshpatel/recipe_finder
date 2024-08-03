import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/controllers/recipe_controller.dart';
import 'package:recipe_finder/core/constants/image_constant.dart';
import 'package:recipe_finder/screens/recipe_list_screen.dart';
import 'package:recipe_finder/screens/favorite_recipes_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.put(RecipeController());
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
    resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImage.homeScreenPng),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Enter ingredients',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (searchController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter some text'),
                        ),
                      );
                    } else {
                      controller.searchRecipes(searchController.text);
                      Get.to(() => const RecipeListScreen(),
                          transition: Transition.fadeIn);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red, size: 32),
              onPressed: () {
                Get.to(() => FavoriteRecipesScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
