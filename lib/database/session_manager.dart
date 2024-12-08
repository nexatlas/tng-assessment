import 'package:shared_preferences/shared_preferences.dart';

class SessionManager extends SessionManagerInterface {
  static final SessionManager instance = SessionManager._internal();

  factory SessionManager() => instance;

  SessionManager._internal();

  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  @override
  void save<T>(String key, T data) {
    switch (T) {
      case String:
        _sharedPreferences.setString(key, data as String);
        break;
      case double:
        _sharedPreferences.setDouble(key, data as double);
        break;
      case bool:
        _sharedPreferences.setBool(key, data as bool);
        break;
      case int:
        _sharedPreferences.setInt(key, data as int);
        break;
      case const (List<String>):
        _sharedPreferences.setStringList(key, data as List<String>);
        break;
    }
  }

  @override
  T? fetch<T>(String key) {
    switch (T) {
      case String:
        return _sharedPreferences.getString(key) as T?;
      case double:
        return _sharedPreferences.getDouble(key) as T?;
      case bool:
        return _sharedPreferences.getBool(key) as T?;
      case int:
        return _sharedPreferences.getInt(key) as T?;
      case const (List<String>):
        return _sharedPreferences.getStringList(key) as T?;
    }
    return null;
  }

  @override
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }

}

extension FavoritesSession on SessionManager {
  set userLikes(List<String> value) => save("likes", value);

  List<String> get userLikes => fetch("likes") ?? [];

  void addFavorite(String value) {
    var recipeLikes = userLikes;
    recipeLikes.add(value);
    userLikes = recipeLikes;
  }

  void removeFavorite(String value) {
    var recipeLikes = userLikes;
    recipeLikes.remove(value);
    userLikes = recipeLikes;
  }

  bool isLiked(String recipeId) =>
      SessionManager.instance.userLikes.contains(recipeId);

  void toggleLike(String recipeId) async {
    if(isLiked(recipeId)){
      removeFavorite(recipeId);
    } else {
      addFavorite(recipeId);
    }
  }
}

abstract class SessionManagerInterface {
  void save<T>(String key, T data);

  T? fetch<T>(String key);

  void clear();
}