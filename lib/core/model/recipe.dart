import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final int id;
  final String title;
  final String image;

  Recipe({required this.id, required this.title, required this.image});

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class RecipeDetail {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;
  final String instructions;
  final List<ExtendedIngredient> extendedIngredients;

  RecipeDetail({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
    required this.instructions,
    required this.extendedIngredients,
  });

  factory RecipeDetail.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDetailToJson(this);
}

@JsonSerializable()
class ExtendedIngredient {
  final String name;
  final double amount;
  final String unit;

  ExtendedIngredient({
    required this.name,
    required this.amount,
    required this.unit,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendedIngredientToJson(this);
}

