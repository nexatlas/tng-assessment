import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_wizz/core/core.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RecipeCard extends HookWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  /// Recipe
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return AppTransparentContainer(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: CachedNetworkImage(
            imageUrl: recipe.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
              width: 100,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: greyColor,
              ),
            ),
          ),
        ),
        title: Text(
          recipe.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: whiteColor,
          ),
        ),
        subtitle: Text(
          recipe.description,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: whiteColor,
          ),
        ),
        onTap: () =>
            context.router.pushWidget(RecipeDetailsScreen(recipe: recipe)),
      ),
    );
  }
}
