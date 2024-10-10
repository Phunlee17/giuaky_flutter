class Category {
  String id;
  String name;
  String description;
  List<String> productIds; // Danh sách ID sản phẩm thuộc danh mục

  Category({required this.id, required this.name, required this.description, required this.productIds});

  factory Category.fromMap(Map<String, dynamic> data, String documentId) {
    return Category(
      id: documentId,
      name: data['name'],
      description: data['description'],
      productIds: List<String>.from(data['productIds'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'productIds': productIds,
    };
  }
}
