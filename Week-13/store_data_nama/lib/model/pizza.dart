class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int? ?? 0;
    final name = (json['pizza_name'] ?? json['pizzaName']) as String? ?? '';
    final desc = json['description'] as String? ?? '';
    final rawPrice = json['price'];
    double price;
    if (rawPrice is int) {
      price = rawPrice.toDouble();
    } else if (rawPrice is double) {
      price = rawPrice;
    } else if (rawPrice is String) {
      price = double.tryParse(rawPrice) ?? 0.0;
    } else {
      price = 0.0;
    }
    final image = (json['image_url'] ?? json['imageUrl']) as String? ?? '';

    return Pizza(
      id: id,
      pizzaName: name,
      description: desc,
      price: price,
      imageUrl: image,
    );
  }
}
