import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String image,
    @Default(<String>[]) List<String> ingredients,
    @Default(<String>[]) List<String> instructions,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
