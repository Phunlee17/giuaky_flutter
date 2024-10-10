import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProductPage extends StatefulWidget {
  final DocumentSnapshot<Object?>? product;

  AddProductPage({this.product});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  File? _image;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      Map<String, dynamic> data = widget.product!.data() as Map<String, dynamic>;
      nameController.text = data['name'];
      categoryController.text = data['category'];
      priceController.text = data['price'].toString();
      descriptionController.text = data['description'];
      quantityController.text = data['quantity'].toString();
      _imageUrl = data['image'];
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;
    final storageRef = FirebaseStorage.instance.ref().child('product_images/${DateTime.now()}.png');
    await storageRef.putFile(_image!);
    _imageUrl = await storageRef.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Thêm Sản phẩm' : 'Sửa Sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Tên sản phẩm'),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Danh mục sản phẩm'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Giá'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Mô tả sản phẩm'),
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Số lượng'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            _image == null
                ? _imageUrl != null
                ? Image.network(_imageUrl!)
                : Container()
                : Image.file(_image!),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Chọn Hình Ảnh'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty ||
                    categoryController.text.isEmpty ||
                    priceController.text.isEmpty ||
                    descriptionController.text.isEmpty ||
                    quantityController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')),
                  );
                  return;
                }

                if (_image != null) {
                  await _uploadImage();
                }

                final productData = {
                  'name': nameController.text,
                  'category': categoryController.text,
                  'price': double.parse(priceController.text),
                  'description': descriptionController.text,
                  'quantity': int.parse(quantityController.text),
                  'image': _imageUrl,
                };

                if (widget.product == null) {
                  FirebaseFirestore.instance.collection('products').add(productData);
                } else {
                  FirebaseFirestore.instance.collection('products').doc(widget.product!.id).update(productData);
                }

                Navigator.pop(context);
              },
              child: Text(widget.product == null ? 'Thêm Sản phẩm' : 'Cập nhật Sản phẩm'),
            ),
          ],
        ),
      ),
    );
  }
}
