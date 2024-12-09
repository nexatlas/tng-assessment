// lib/core/services/recipe_service.dart

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/recipe.dart';

/// An abstract class defining the contract for Recipe services.
abstract class RecipeService {
  /// Fetches a list of recipes.
  Future<List<Recipe>> fetchRecipes();

  /// Searches for recipes based on a query string.
  Future<List<Recipe>> searchRecipes({required String query});
}

/// Implementation of [RecipeService] that reads recipes from a local JSON file.
class RecipeServiceImpl extends RecipeService {
  /// The path to the local JSON file containing recipes.
  static const String _recipesAssetPath = 'assets/json/recipes.json';

  /// [Ref] instance from Riverpod for dependency injection.
  final Ref ref;

  /// Constructs a [RecipeServiceImpl] with the given [ref].
  RecipeServiceImpl({required this.ref});

  /// Loads the JSON data from the asset file.
  Future<String> _loadRecipesJson() async {
    try {
      return await rootBundle.loadString(_recipesAssetPath);
    } catch (e) {
      // Log the error or handle it as needed
      throw Exception('Error loading recipes.json: $e');
    }
  }

  @override
  Future<List<Recipe>> fetchRecipes() async {
    try {
      final jsonString = await _loadRecipesJson();
      return Recipe.listFromJson(jsonString);
    } catch (e) {
      // Rethrow the exception to be handled by the caller
      throw Exception('Failed to load recipes: $e');
    }
  }

  @override
  Future<List<Recipe>> searchRecipes({required String query}) async {
    try {
      final allRecipes = await fetchRecipes();
      // Simple search implementation: case-insensitive substring match
      return allRecipes
          .where((recipe) =>
              recipe.name.toLowerCase().contains(query.toLowerCase()) ||
              recipe.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } catch (e) {
      // Rethrow the exception to be handled by the caller
      throw Exception('Failed to search recipes: $e');
    }
  }
}

/// Riverpod provider for [RecipeService].
final recipeServiceProvider = Provider<RecipeService>((ref) {
  return RecipeServiceImpl(ref: ref);
});