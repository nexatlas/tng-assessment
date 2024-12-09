// lib/features/recipe_details/presentation/recipe_details_notifier.dart

import 'package:chefwizz/features/favourites/presentation/widgets/favorites_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A class that manages actions related to the Recipe Details screen.
class RecipeDetailsNotifier {
  final int recipeId;
  final FavoritesNotifier _favoritesNotifier;

  RecipeDetailsNotifier({
    required this.recipeId,
    required FavoritesNotifier favoritesNotifier,
  }) : _favoritesNotifier = favoritesNotifier;

  /// Toggles the favorite status of the recipe.
  void toggleFavorite() {
    _favoritesNotifier.toggleFavorite(recipeId);
  }

  /// Checks if the recipe is favorite.
  bool isFavorite(Set<int> favorites) {
    return favorites.contains(recipeId);
  }
}

/// Riverpod provider for [RecipeDetailsNotifier].
final recipeDetailsNotifierProvider =
    Provider.family<RecipeDetailsNotifier, int>((ref, recipeId) {
  final favoritesNotifier = ref.read(favoritesProvider.notifier);
  return RecipeDetailsNotifier(
    recipeId: recipeId,
    favoritesNotifier: favoritesNotifier,
  );
});
