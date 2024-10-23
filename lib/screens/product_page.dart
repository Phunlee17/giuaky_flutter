import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_product_page.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quản Lý Sản Phẩm',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Thêm kiểu chữ cho tiêu đề
        ),
        backgroundColor: Colors.green, // Thêm màu nền cho AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductPage()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var products = snapshot.data!.docs;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              Map<String, dynamic> data = product.data() as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Thêm khoảng cách giữa các sản phẩm
                elevation: 5, // Thêm độ cao cho card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bo tròn góc của card
                ),
                child: ListTile(
                  title: Text(
                    data['name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Thêm kiểu chữ cho tên sản phẩm
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data['category']} - \$${data['price']}',
                        style: TextStyle(color: Colors.grey[800]), // Thêm màu cho giá và danh mục sản phẩm
                      ),
                      Text('Mô tả: ${data['description']}'),
                      Text('Số lượng: ${data['quantity']}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue), // Thêm màu cho icon chỉnh sửa
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddProductPage(product: product)),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red), // Thêm màu cho icon xóa
                        onPressed: () {
                          FirebaseFirestore.instance.collection('products').doc(product.id).delete();
                        },
                      ),
                    ],
                  ),
                  onTap: () {
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
