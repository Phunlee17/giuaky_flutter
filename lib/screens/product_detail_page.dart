import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailPage extends StatelessWidget {
  final DocumentSnapshot product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = product.data() as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            data['image'] != null
                ? Image.network(data['image'])
                : Icon(Icons.image_not_supported),
            SizedBox(height: 16.0),
            Text(
              data['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Loại: ${data['category']}'),
            SizedBox(height: 8.0),
            Text('Giá: \$${data['price']}'),
            SizedBox(height: 8.0),
            Text('Mô tả: ${data['description']}'),
            SizedBox(height: 8.0),
            Text('Số lượng: ${data['quantity']}'),
          ],
        ),
      ),
    );
  }
}
