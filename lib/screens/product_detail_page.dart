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
        title: Text(
          data['name'],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Thêm kiểu chữ cho tiêu đề
        ),
        backgroundColor: Colors.green, // Thêm màu nền cho AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Thêm kiểu chữ và màu cho tên sản phẩm
            ),
            SizedBox(height: 8.0),
            Text(
              'Loại: ${data['category']}',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]), // Thêm kiểu chữ và màu cho loại sản phẩm
            ),
            SizedBox(height: 8.0),
            Text(
              'Giá: \$${data['price']}',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]), // Thêm kiểu chữ và màu cho giá sản phẩm
            ),
            SizedBox(height: 8.0),
            Text(
              'Mô tả: ${data['description']}',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]), // Thêm kiểu chữ và màu cho mô tả sản phẩm
            ),
            SizedBox(height: 8.0),
            Text(
              'Số lượng: ${data['quantity']}',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]), // Thêm kiểu chữ và màu cho số lượng sản phẩm
            ),
          ],
        ),
      ),
    );
  }
}
