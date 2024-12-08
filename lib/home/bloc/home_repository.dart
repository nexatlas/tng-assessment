import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tng_assessment/home/models/recipe_response_model.dart';

class HomeRepository {

  Future<List<RecipeData>> fetchRecipes() async {
    final String response =
        await rootBundle.loadString("assets/json/recipes.json");
    final List<dynamic> data = jsonDecode(response) as List<dynamic>;
    return data.map((recipeJson) => RecipeData.fromJson(recipeJson)).toList();
  }
}
