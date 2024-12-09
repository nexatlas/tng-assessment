// lib/core/widgets/recipe_card.dart

import 'package:chefwizz/features/favourites/presentation/widgets/favorites_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A reusable card widget to display recipe information.
class RecipeCard extends ConsumerWidget {
  /// Name of the recipe.
  final String name;

  /// Short description of the recipe.
  final String description;

  /// URL to the recipe's thumbnail image.
  final String imageUrl;

  /// Callback when the card is tapped.
  final VoidCallback onTap;

  /// ID of the recipe.
  final int recipeId;

  /// Constructs a [RecipeCard] with the given parameters.
  const RecipeCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.onTap,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the FavoritesNotifier to check and toggle favorites.
    final favorites = ref.watch(favoritesProvider);
    final favoritesNotifier = ref.read(favoritesProvider.notifier);
    final isFavorite = favorites.contains(recipeId);

    print('RecipeCard: Building card for "$name". Is favorite: $isFavorite');

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Recipe Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, color: Colors.grey, size: 50),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Recipe Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Favorite Icon
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                favoritesNotifier.toggleFavorite(recipeId);
                debugPrint('RecipeCard: Toggled favorite for "$name". Now favorite: ${!isFavorite}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
