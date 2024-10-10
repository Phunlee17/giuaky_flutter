class Product {
  String id;
  String name;
  String category;
  double price;
  String description;
  int quantity;
  String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.quantity,
    required this.imageUrl,
  });

  factory Product.fromMap(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      name: data['name'],
      category: data['category'],
      price: data['price'],
      description: data['description'],
      quantity: data['quantity'],
      imageUrl: data['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'description': description,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }
}
