import 'package:chef_wizz/app/app_locator.dart';
import 'package:chef_wizz/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_state.dart';
part 'recipe_cubit.freezed.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit({
    RecipeRepository? recipeRepository,
  })  : _recipeRepository = recipeRepository ?? locator<RecipeRepository>(),
        super(const RecipeState.initial());

  /// Recipe repository.
  final RecipeRepository _recipeRepository;

  /// Get recipes from [RecipeRepository]
  Future<void> getRecipes() async {
    try {
      emit(
        _Loading(
          recipes: state.recipes,
          filteredRecipes: state.filteredRecipes,
        ),
      );
      final recipes = await _recipeRepository.getRecipes();
      emit(_Loaded(recipes: recipes, filteredRecipes: recipes));
    } on RecipeException catch (e) {
      emit(
        _Error(
          recipes: state.recipes,
          filteredRecipes: state.filteredRecipes,
          error: e.message,
        ),
      );
    }
  }

  /// Search and filter recipes by name
  Future<void> filterRecipes(String recipeName) async {
    try {
      emit(
        _Loading(
          recipes: state.recipes,
          filteredRecipes: state.filteredRecipes,
        ),
      );
      final filteredRecipes = state.recipes
          .where(
            (recipe) =>
                recipe.name.toLowerCase().contains(recipeName.toLowerCase()),
          )
          .toList();
      emit(_Loaded(recipes: state.recipes, filteredRecipes: filteredRecipes));
    } on RecipeException catch (e) {
      emit(
        _Error(
          recipes: state.recipes,
          filteredRecipes: state.filteredRecipes,
          error: e.message,
        ),
      );
    }
  }
}
