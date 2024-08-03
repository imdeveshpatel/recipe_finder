// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };

RecipeDetail _$RecipeDetailFromJson(Map<String, dynamic> json) => RecipeDetail(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      readyInMinutes: (json['readyInMinutes'] as num).toInt(),
      servings: (json['servings'] as num).toInt(),
      instructions: json['instructions'] as String,
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>)
          .map((e) => ExtendedIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeDetailToJson(RecipeDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'instructions': instance.instructions,
      'extendedIngredients': instance.extendedIngredients,
    };

ExtendedIngredient _$ExtendedIngredientFromJson(Map<String, dynamic> json) =>
    ExtendedIngredient(
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$ExtendedIngredientToJson(ExtendedIngredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };
