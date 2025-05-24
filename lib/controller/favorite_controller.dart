import 'package:flutter/material.dart';
import 'package:ksehat/widget/menu_item_model.dart';

class FavoriteController extends ChangeNotifier {
  final List<MenuItem> _favorites = [];

  List<MenuItem> get favorites => _favorites;

  void toggleFavorite(MenuItem item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
      item.isFavorite = false;
    } else {
      _favorites.add(item);
      item.isFavorite = true;
    }
    notifyListeners();
  }

  bool isFavorite(MenuItem item) => _favorites.contains(item);
}
