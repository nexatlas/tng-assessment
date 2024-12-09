// lib/features/home/presentation/home_notifier.dart

import 'dart:async';
import 'package:chefwizz/core/api_service/recipe_service.dart';
import 'package:chefwizz/core/models/recipe_state.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A [StateNotifier] that manages the state of recipes in the Home feature.
class HomeNotifier extends StateNotifier<RecipeState> {
  /// The [RecipeService] used to fetch and search recipes.
  final RecipeService _recipeService;

  /// Constructs a [HomeNotifier] with the given [RecipeService].
  HomeNotifier(this._recipeService) : super(RecipeState.initial()) {
    // Automatically fetch recipes when the notifier is created.
    fetchRecipes();
  }

  /// Fetches all recipes and updates the state.
  Future<void> fetchRecipes() async {
    try {
      debugPrint('HomeNotifier: Fetching all recipes...');
      state = state.copyWith(isLoading: true, errorMessage: null);
      final recipes = await _recipeService.fetchRecipes();
      debugPrint('HomeNotifier: Fetched ${recipes.length} recipes.');
      state = state.copyWith(recipes: recipes, isLoading: false);
    } catch (e) {
      debugPrint('HomeNotifier: Error fetching recipes - $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Searches for recipes based on the provided [query] and updates the state.
  Future<void> searchRecipes(String query) async {
    if (query.isEmpty) {
      debugPrint('HomeNotifier: Search query is empty. Fetching all recipes.');
      await fetchRecipes();
      return;
    }

    try {
      debugPrint('HomeNotifier: Searching recipes with query "$query"...');
      state = state.copyWith(isLoading: true, errorMessage: null);
      final recipes = await _recipeService.searchRecipes(query: query);
      debugPrint('HomeNotifier: Found ${recipes.length} recipes matching "$query".');
      state = state.copyWith(recipes: recipes, isLoading: false);
    } catch (e) {
      debugPrint('HomeNotifier: Error searching recipes - $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}

/// Riverpod provider for [HomeNotifier].
final homeNotifierProvider = StateNotifierProvider<HomeNotifier, RecipeState>((ref) {
  final recipeService = ref.read(recipeServiceProvider);
  return HomeNotifier(recipeService);
});
