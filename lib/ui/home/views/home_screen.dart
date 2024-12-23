import 'package:chef_wizz/features/features.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:chef_wizz/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.appLocalizations;
    final searchController = useTextEditingController();
    final recipeState = context.watch<RecipeCubit>().state;
    final recipeCubit = context.read<RecipeCubit>();
    return ScaffoldLayout(
      padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 24, 16, 0),
      child: Column(
        children: [
          Text(
            locale.chefWizz,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: whiteColor,
            ),
          ),
          const SizedBox(height: 36),
          AppTextField(
            controller: searchController,
            hintText: locale.searchRecipes,
            onChanged: recipeCubit.filterRecipes,
          ),
          const SizedBox(height: 12),
          if (recipeState.filteredRecipes.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Text(
                  locale.noRecipes,
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
                    recipeCubit.getRecipes();
                    context.read<RecipeFavoritesCubit>().getFavoriteRecipes();
                  });
                },
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: recipeState.filteredRecipes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final recipe = recipeState.filteredRecipes[index];
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
