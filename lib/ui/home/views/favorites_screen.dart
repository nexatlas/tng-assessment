import 'package:chef_wizz/features/features.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:chef_wizz/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.appLocalizations;
    final recipeFavoritesState = context.watch<RecipeFavoritesCubit>().state;
    return ScaffoldLayout(
      padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 24, 16, 0),
      child: Column(
        children: [
          Text(
            locale.favorites,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: whiteColor,
            ),
          ),
          if (recipeFavoritesState.recipes.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Text(
                  locale.noFavorites,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: whiteColor,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  Future.delayed(Duration.zero, () {
                    if (!context.mounted) return;
                    context.read<RecipeFavoritesCubit>().getFavoriteRecipes();
                    context.read<RecipeCubit>().getRecipes();
                  });
                },
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: recipeFavoritesState.recipes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final recipe = recipeFavoritesState.recipes[index];
                    return RecipeCard(recipe: recipe);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
