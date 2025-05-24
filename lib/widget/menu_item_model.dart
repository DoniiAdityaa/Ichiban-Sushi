class MenuItem {
  final String name;
  final String description;
  final String imageAssetsPath;
  final String category;
  final String price;
  bool isFavorite;

  MenuItem({
    required this.name,
    required this.description,
    required this.imageAssetsPath,
    required this.category,
    required this.price,
    this.isFavorite = false,
  });
}
