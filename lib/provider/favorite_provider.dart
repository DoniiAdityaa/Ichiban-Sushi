import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void toggleFavorite(Map<String, String> item) {
    final exists = _favorites.any((fav) => fav['name'] == item['name']);

    if (exists) {
      _favorites.removeWhere((fav) => fav['name'] == item['name']);
    } else {
      _favorites.add(item);
    }

    notifyListeners();
  }

  bool isFavorite(Map<String, String> item) {
    return _favorites.any((fav) => fav['name'] == item['name']);
  }

  void removeFavorite(Map<String, String> item) {
    _favorites.removeWhere((fav) => fav['name'] == item['name']);
    notifyListeners();
  }
}
