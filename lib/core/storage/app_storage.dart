import 'dart:convert';

import 'package:chef_wizz/core/models/models.dart';
import 'package:chef_wizz/core/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppStorage {
  static Box<String>? _box;

  /// Init hive
  static Future<void> init() async {
    await Hive.initFlutter();
    if (!boxInitialized()) {
      _box = await Hive.openBox<String>(boxName);
    }
  }

  /// Check if box is initialized
  static bool boxInitialized() {
    return _box?.isOpen ?? false;
  }

  /// Open hive box
  static Future<void> open() async {
    _box = await Hive.openBox(boxName);
  }

  /// Close hive box
  static Future<void> close() async {
    await Hive.close();
  }

  /// Delete storage
  static Future<void> clear() async {
    await _box?.delete(recipeFavoritesKey);
    await _box?.clear();
  }

  /// Get recipe favorties from the box
  static List<Recipe> getRecipeFavorites() {
    try {
      final recipes = _box?.get(recipeFavoritesKey);
      if (recipes?.isNotEmpty ?? false) {
        final recipeJson =
            (jsonDecode(recipes!) as List).cast<Map<String, dynamic>>();
        return recipeJson.map(Recipe.fromJson).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  /// Save reciepe favorites
  static Future<void> saveRecipeFavorite(List<Recipe> recipes) async {
    try {
      await _box?.put(
        recipeFavoritesKey,
        jsonEncode(recipes.map((recipe) => recipe.toJson()).toList()),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
