import 'package:chefwizz/core/utils/extensions/context_extensions.dart';
import 'package:chefwizz/core/utils/helpers/use_debounce.dart';
import 'package:chefwizz/core/widgets/loading_indicator.dart';
import 'package:chefwizz/features/home/presentation/widgets/recipe_card.dart';
import 'package:chefwizz/features/home/presentation/widgets/search_bar.dart';
import 'package:chefwizz/features/home/providers/home_notifier.dart';
import 'package:chefwizz/features/recipe_details/presentation/screens/recipe_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A [HookConsumerWidget] that displays featured recipes and a search bar.
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the current state of [HomeNotifier].
    final recipeState = ref.watch(homeNotifierProvider);

    // Access the notifier to perform actions.
    final homeNotifier = ref.read(homeNotifierProvider.notifier);

    // Controller for the search TextField.
    final searchTextController = useTextEditingController();
    final searchQuery = useState<String>('');

    // Implement debounced search.
    useDebounce(
      searchQuery.value,
      const Duration(milliseconds: 500),
      () {
        debugPrint('HomeScreen: Debounced search query: "${searchQuery.value}"');
        homeNotifier.searchRecipes(searchQuery.value);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: SearchBarWidget(
          searchTextController: searchTextController,
          onChanged: (query) {
            debugPrint('HomeScreen: Search query changed to "$query"');
            searchQuery.value = query;
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Display error message if any
            if (recipeState.errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  recipeState.errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            // Recipes List or Loading Indicator
            Expanded(
              child: recipeState.isLoading
                  ? const LoadingIndicator()
                  : recipeState.recipes.isEmpty
                      ? const Center(
                          child: Text(
                            'No recipes found',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : ListView.builder(
                          itemCount: recipeState.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipeState.recipes[index];
                            debugPrint('HomeScreen: Building RecipeCard for "${recipe.name}"');
                            return RecipeCard(
                              name: recipe.name,
                              description: recipe.description,
                              imageUrl: recipe.image,
                              recipeId: recipe.id,
                              onTap: () {
                                // Navigate to Recipe Details Screen
                                context.push(
                                  RecipeDetailsScreen(recipe: recipe),
                                );
                              },
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
