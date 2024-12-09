import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class LocalService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final Box<String> tokenBox = Hive.box<String>('tokens');
  final Box<bool> favoritesBox = Hive.box<bool>('favorites');

  LocalService._privateConstructor();

  static final LocalService _instance = LocalService._privateConstructor();

  factory LocalService() {
    return _instance;
  }

  Future<void> storeAccessToken(String token) async {
    await secureStorage.write(key: 'accessToken', value: token);
  }

  Future<String?> getAccessToken() async {
    return await secureStorage.read(key: 'accessToken');
  }

  Future<void> storeTerminalId(String terminalId) async {
    await secureStorage.write(key: 'terminalId', value: terminalId);
  }

  Future<String> getTerminalId() async {
    return await secureStorage.read(key: 'terminalId') ?? "";
  }

  Future<void> storeBusinessId(int businessId) async {
    return await secureStorage.write(key: 'businessId', value: businessId.toString());
  }

  Future<int?> getBusinessId() async {
    final businessId = await secureStorage.read(key: 'businessId');
    return businessId != null ? int.parse(businessId) : null;
  }

  Future<void> clearAll() async {
    await secureStorage.deleteAll();
    await favoritesBox.clear(); // Clear favorites as well if needed
  }

  // Favorites methods
  Future<void> addFavorite(int recipeId) async {
    await favoritesBox.put(recipeId, true);
  }

  Future<void> removeFavorite(int recipeId) async {
    await favoritesBox.delete(recipeId);
  }

  List<int> getFavorites() {
    return favoritesBox.keys.cast<int>().toList();
  }

  bool isFavorite(int recipeId) {
    return favoritesBox.containsKey(recipeId);
  }
}
