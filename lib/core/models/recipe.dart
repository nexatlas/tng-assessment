// lib/core/models/recipe.dart

import 'dart:convert';

class Recipe {
  final int id;
  final String name;
  final String description;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;

  const Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
      instructions: List<String>.from(json['instructions'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }

  static List<Recipe> listFromJson(String jsonString) {
    final data = json.decode(jsonString) as List<dynamic>;
    return data.map((json) => Recipe.fromJson(json as Map<String, dynamic>)).toList();
  }

  static String listToJson(List<Recipe> recipes) {
    final data = recipes.map((recipe) => recipe.toJson()).toList();
    return json.encode(data);
  }
}
