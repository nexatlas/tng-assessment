part of 'recipe_cubit.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.initial({
    @Default(<Recipe>[]) List<Recipe> recipes,
    @Default(<Recipe>[]) List<Recipe> filteredRecipes,
  }) = _Initial;
  const factory RecipeState.loading({
    @Default(<Recipe>[]) List<Recipe> recipes,
    @Default(<Recipe>[]) List<Recipe> filteredRecipes,
  }) = _Loading;
  const factory RecipeState.loaded({
    required List<Recipe> recipes,
    required List<Recipe> filteredRecipes,
  }) = _Loaded;
  const factory RecipeState.error({
    @Default(<Recipe>[]) List<Recipe> recipes,
    @Default(<Recipe>[]) List<Recipe> filteredRecipes,
    String? error,
  }) = _Error;
}
