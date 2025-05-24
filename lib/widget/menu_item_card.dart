import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/favorite_controller.dart';
import 'menu_item_model.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final favoriteController = context.read<FavoriteController>();

    return Card(
      child: ListTile(
        leading: Image.asset(item.imageAssetsPath, width: 55, height: 50),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: IconButton(
          icon: Icon(
            item.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: item.isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            favoriteController.toggleFavorite(item);
          },
        ),
      ),
    );
  }
}
