class MainProductModal {
  final String id, title, description, imgUrl;
  final double price;
  final bool isFavorite;

  MainProductModal({
    required this.description,
    required this.id,
    required this.imgUrl,
    this.isFavorite = false,
    required this.price,
    required this.title,
  });
}
