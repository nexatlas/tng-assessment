import 'dart:core';

import 'package:flutter/material.dart';
import 'package:tng_assessment/database/session_manager.dart';
import 'package:tng_assessment/main/main_screen.dart';

import '../details/recipe_details.dart';
import '../home/bloc/home_repository.dart';
import '../home/models/recipe_response_model.dart';

class FavoritesScreen extends StatefulWidget {
  static const String id = 'favorites_screen';

  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final HomeRepository repository = HomeRepository();
  List<RecipeData>? likedRecipes;

  @override
  void initState() {
    super.initState();
    _getLikedRecipes();
  }

  Future<List<RecipeData>> _getLikedRecipes() async {
    final recipes = await repository.fetchRecipes();
    final savedRecipes = SessionManager.instance.userLikes;
    return recipes.where((recipe) => savedRecipes.contains(recipe.id.toString())).toList();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff191919),
        leading: null,centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Favorites",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
        ),
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: favoritesNotifier,
        builder: (context, _, __){
          return FutureBuilder<List<RecipeData>>(
            future: _getLikedRecipes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No favorites yet!'));
              }
              final likedRecipes = snapshot.data!;
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  final recipe = likedRecipes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => RecipeDetailsScreen(recipeData: recipe)));
                    },
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius:
                                BorderRadius.circular(100),
                                child: Container(
                                    height: 100,
                                    width: 100,
                                    child:
                                    Image.network(recipe.image!))),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Text(
                                    recipe.name!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    recipe.description!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black
                                            .withOpacity(0.55)),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    // Enables text wrapping.
                                    maxLines: 2,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 15),
                itemCount: likedRecipes!.length,
              );
            },
          );
        },
      ),
    );
  }
}
