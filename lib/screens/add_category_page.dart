import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class AddCategoryPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _productIdsController = TextEditingController(); // Field để nhập danh sách ID sản phẩm

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Danh Mục Sản Phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Tên danh mục'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Mô tả'),
            ),
            TextField(
              controller: _productIdsController,
              decoration: InputDecoration(labelText: 'Danh sách ID sản phẩm (phân tách bằng dấu phẩy)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final productIds = _productIdsController.text.split(',').map((id) => id.trim()).toList();
                final category = Category(
                  id: '',
                  name: _nameController.text,
                  description: _descriptionController.text,
                  productIds: productIds,
                );

                FirebaseFirestore.instance.collection('categories').add(category.toMap());
                Navigator.pop(context);
              },
              child: Text('Thêm Danh Mục'),
            ),
          ],
        ),
      ),
    );
  }
}
