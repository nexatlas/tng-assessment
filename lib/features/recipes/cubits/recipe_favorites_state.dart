part of 'recipe_favorites_cubit.dart';

@freezed
class RecipeFavoritesState with _$RecipeFavoritesState {
  const factory RecipeFavoritesState.initial({
    @Default(<Recipe>[]) List<Recipe> recipes,
  }) = _Initial;
  const factory RecipeFavoritesState.loading({
    @Default(<Recipe>[]) List<Recipe> recipes,
  }) = _Loading;
  const factory RecipeFavoritesState.loaded({
    required List<Recipe> recipes,
  }) = _Loaded;
  const factory RecipeFavoritesState.error({
    @Default(<Recipe>[]) List<Recipe> recipes,
    String? error,
  }) = _Error;
}
