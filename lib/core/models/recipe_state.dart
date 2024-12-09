// lib/core/models/recipe_state.dart

import 'package:equatable/equatable.dart';
import 'recipe.dart';

/// A state class that holds the list of recipes and related information.
class RecipeState extends Equatable {
  /// List of recipes.
  final List<Recipe> recipes;

  /// Indicates if the data is currently loading.
  final bool isLoading;

  /// Holds any error messages.
  final String? errorMessage;

  /// Constructs a [RecipeState] instance.
  const RecipeState({
    required this.recipes,
    this.isLoading = false,
    this.errorMessage,
  });

  /// Creates an initial [RecipeState] with default values.
  factory RecipeState.initial() {
    return const RecipeState(recipes: []);
  }

  /// Creates a copy of the current state with updated fields.
  RecipeState copyWith({
    List<Recipe>? recipes,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RecipeState(
      recipes: recipes ?? this.recipes,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [recipes, isLoading, errorMessage];
}
