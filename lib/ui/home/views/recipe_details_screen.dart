import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_wizz/core/core.dart';
import 'package:chef_wizz/features/recipes/cubits/recipe_favorites_cubit.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    super.key,
    required this.recipe,
  });

  /// Recipe
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<RecipeFavoritesCubit>().state.recipes;
    final isFavorite =
        favorites.where((e) => e.id == recipe.id).toList().isNotEmpty;
    return ScaffoldLayout(
      padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 24, 16, 0),
      child: Column(
        children: [
          CustomHeader(
            title: recipe.name,
            trailing: FavoriteButton(
              iconSize: 48,
              isFavorite: isFavorite,
              valueChanged: (value) {
                if (value) {
                  context
                      .read<RecipeFavoritesCubit>()
                      .addFavoriteRecipe(recipe);
                } else {
                  context
                      .read<RecipeFavoritesCubit>()
                      .removeFavoriteRecipe(recipe);
                }
              },
            ),
          ),
          const SizedBox(height: 36),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: recipe.image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                        width: double.infinity,
                        height: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    recipe.description,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ingredients:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.ingredients
                        .map<Widget>(
                          (ingredient) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text('- $ingredient'),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Instructions:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.instructions
                        .map<Widget>(
                          (step) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text('- $step'),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
