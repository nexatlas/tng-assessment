// ignore_for_file: unused_element, unused_field

import 'dart:convert';

import 'package:chef_wizz/core/core.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

/// {@template recipe_repository_exception}
/// General exception for [RecipeRepository] methods.
/// {@endtemplate}
class RecipeException implements Exception {
  /// {@macro recipe_repository_exception}
  const RecipeException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

/// {@template recipe_repository}
/// Recipe repository interacts with the recipe API.
/// {@endtemplate}
class RecipeRepository {
  /// {@macro recipe_repository}
  RecipeRepository({
    required String baseUrl,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _client = client ?? http.Client();

  final http.Client _client;
  final String _baseUrl;

  /// Get recipe endpoint
  String _getRecipeEndpoint() => '$_baseUrl/recipe';

  /// Get recipes
  ///
  /// Returns list of [Recipe] on success.
  /// Throws [RecipeException] when operation fails.
  Future<List<Recipe>> getRecipes() async {
    try {
      final recipes = await _loadRecipeJsonData();
      return recipes.map(Recipe.fromJson).toList();

      /// Function will be integrated this way if there was a url endpoint
      /// final url = _getRecipeEndpoint();
      /// final headers = {
      ///   'Accept': 'application/json',
      ///   'Content-Type': 'application/json',
      /// };
      /// return await APIHelper.request<List<Recipe>>(
      ///   request: _client.get(
      ///     Uri.parse(url),
      ///     headers: headers,
      ///   ),
      ///   onSuccessList: (value) => value.map(Recipe.fromJson).toList(),
      /// );
    } on APIException catch (e) {
      throw RecipeException(message: e.message);
    } catch (e) {
      throw const RecipeException();
    }
  }

  /// Load recipe json data
  Future<List<Map<String, dynamic>>> _loadRecipeJsonData() async {
    final jsonString = await rootBundle.loadString('recipes.json');
    return (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();
  }
}
