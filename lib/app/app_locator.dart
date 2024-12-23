// ignore_for_file: unused_local_variable

import 'package:chef_wizz/app/app_constants.dart';
import 'package:chef_wizz/core/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

/// Global [GetIt.instance].
final locator = GetIt.instance;

/// Set up [GetIt] locator.
Future<void> setUpLocator() async {
  final baseUrl = dotenv.get(Constants.apiBaseUrl);
  locator.allowReassignment = true;
  locator
      .registerSingleton<RecipeRepository>(RecipeRepository(baseUrl: baseUrl));
}
