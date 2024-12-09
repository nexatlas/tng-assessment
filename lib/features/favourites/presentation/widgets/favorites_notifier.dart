// lib/core/services/favorites_notifier.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A [StateNotifier] that manages the set of favorite recipe IDs.
class FavoritesNotifier extends StateNotifier<Set<int>> {
  FavoritesNotifier() : super(<int>{});

  /// Toggles the favorite status of a recipe.
  void toggleFavorite(int recipeId) {
    if (state.contains(recipeId)) {
      state = Set.from(state)..remove(recipeId);
    } else {
      state = Set.from(state)..add(recipeId);
    }
  }

  /// Checks if a recipe is marked as favorite.
  bool isFavorite(int recipeId) {
    return state.contains(recipeId);
  }
}

/// Riverpod provider for [FavoritesNotifier].
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Set<int>>((ref) {
  return FavoritesNotifier();
});
