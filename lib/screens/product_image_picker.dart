import 'package:flutter/material.dart';
import 'dart:io';

class ProductImagePicker extends StatelessWidget {
  final File? image;
  final String? imageUrl;
  final VoidCallback onPickImage;

  ProductImagePicker({
    required this.image,
    required this.imageUrl,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image == null
            ? imageUrl != null
            ? Image.network(imageUrl!)
            : Container()
            : Image.file(image!),
        ElevatedButton(
          onPressed: onPickImage,
          child: Text('Chọn Hình Ảnh'),
        ),
      ],
    );
  }
}
