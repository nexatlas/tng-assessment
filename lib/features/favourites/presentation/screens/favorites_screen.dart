// lib/features/favorites/presentation/favorites_screen.dart

import 'package:chefwizz/core/api_service/recipe_service.dart';
import 'package:chefwizz/core/utils/extensions/context_extensions.dart';
import 'package:chefwizz/core/widgets/loading_indicator.dart';
import 'package:chefwizz/features/favourites/presentation/widgets/favorites_notifier.dart';
import 'package:chefwizz/features/home/presentation/widgets/recipe_card.dart';
import 'package:chefwizz/features/recipe_details/presentation/screens/recipe_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A [HookConsumerWidget] that displays favorite recipes.
class FavoritesScreen extends HookConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the set of favorite recipe IDs.
    final favoriteIds = ref.watch(favoritesProvider);

    // Access the RecipeService to fetch all recipes.
    final recipeService = ref.read(recipeServiceProvider);

    // Future to fetch all recipes and filter favorites.
    final favoritesFuture = useMemoized(() async {
      final allRecipes = await recipeService.fetchRecipes();
      return allRecipes.where((recipe) => favoriteIds.contains(recipe.id)).toList();
    }, [favoriteIds]);

    final asyncSnapshot = useFuture(favoritesFuture, initialData: null);

    if (asyncSnapshot.connectionState == ConnectionState.waiting) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          centerTitle: true,
        ),
        body: const LoadingIndicator(),
      );
    }

    if (asyncSnapshot.hasError) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favorites',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Error loading favorites',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final favoriteRecipes = asyncSnapshot.data ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(
              child: Text('No favorite recipes yet'),
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return RecipeCard(
                  name: recipe.name,
                  description: recipe.description,
                  imageUrl: recipe.image,
                  recipeId: recipe.id,
                  onTap: () {
                    // Navigate to Recipe Details Screen
                    context.push(RecipeDetailsScreen(recipe: recipe));
                  },
                );
              },
            ),
    );
  }
}
