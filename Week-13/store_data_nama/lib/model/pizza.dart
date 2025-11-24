const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

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
    // Ambil nilai mentah
    final rawId = json[keyId];
    final rawName =
        json[keyName] ?? json['pizza_name']; // fallback kemungkinan nama lain
    final rawDesc = json[keyDescription];
    final rawPrice = json[keyPrice];
    final rawImage = json[keyImage] ?? json['image_url'];

    // Parsing aman tipe dinamis
    int parsedId;
    if (rawId is int) {
      parsedId = rawId;
    } else if (rawId is String) {
      parsedId = int.tryParse(rawId) ?? 0;
    } else {
      parsedId = 0;
    }

    String name = (rawName?.toString().trim().isNotEmpty == true)
        ? rawName.toString()
        : 'No name';
    String desc = rawDesc?.toString() ?? '';

    double parsedPrice;
    if (rawPrice is double) {
      parsedPrice = rawPrice;
    } else if (rawPrice is int) {
      parsedPrice = rawPrice.toDouble();
    } else if (rawPrice is String) {
      parsedPrice = double.tryParse(rawPrice) ?? 0.0;
    } else {
      parsedPrice = 0.0;
    }

    String image = rawImage?.toString() ?? '';

    return Pizza(
      id: parsedId,
      pizzaName: name,
      description: desc,
      price: parsedPrice,
      imageUrl: image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
