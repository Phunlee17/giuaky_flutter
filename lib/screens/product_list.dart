import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'add_product_page.dart';

class ProductList extends StatelessWidget {
  final String category;
  ProductList({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sản Phẩm - $category'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').where('category', isEqualTo: category).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var products = snapshot.data!.docs;
          if (products.isEmpty) {
            return Center(child: Text('Không có sản phẩm nào trong danh mục này.'));
          }
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              var data = product.data() as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text(data['name'] ?? 'Không có tên sản phẩm', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  subtitle: Text('Giá: ${data['price'] ?? 'Không có giá'} \nSố lượng: ${data['quantity'] ?? 'Không có số lượng'}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddProductPage(product: product)),
                    );
                    // Xử lý sự kiện khi nhấp vào sản phẩm
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
