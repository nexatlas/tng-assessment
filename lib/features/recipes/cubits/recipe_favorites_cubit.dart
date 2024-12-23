import 'package:chef_wizz/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_favorites_state.dart';
part 'recipe_favorites_cubit.freezed.dart';

class RecipeFavoritesCubit extends Cubit<RecipeFavoritesState> {
  RecipeFavoritesCubit() : super(const RecipeFavoritesState.initial());

  /// Get favorite recipes from [AppStorage]
  void getFavoriteRecipes() {
    try {
      emit(_Loading(recipes: state.recipes));
      final favorites = AppStorage.getRecipeFavorites();
      emit(_Loaded(recipes: favorites));
    } on RecipeException catch (e) {
      emit(
        _Error(
          recipes: state.recipes,
          error: e.message,
        ),
      );
    }
  }

  /// Add a recipe to favorite recipes into [AppStorage]
  Future<void> addFavoriteRecipe(Recipe recipe) async {
    try {
      final favorites = AppStorage.getRecipeFavorites();
      final newFavorites = [...favorites, recipe];
      await AppStorage.saveRecipeFavorite(newFavorites);
      getFavoriteRecipes();
    } on RecipeException catch (e) {
      emit(
        _Error(
          recipes: state.recipes,
          error: e.message,
        ),
      );
    }
  }

  /// Remove recipe from favorite recipes
  Future<void> removeFavoriteRecipe(Recipe recipe) async {
    try {
      final favorites = AppStorage.getRecipeFavorites();
      final newFavorites = [...favorites]
        ..removeWhere((favorite) => favorite.id == recipe.id);
      await AppStorage.saveRecipeFavorite(newFavorites);
      getFavoriteRecipes();
    } on RecipeException catch (e) {
      emit(
        _Error(
          recipes: state.recipes,
          error: e.message,
        ),
      );
    }
  }
}
