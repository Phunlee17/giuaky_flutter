import 'package:flutter/material.dart';
import 'add_product_page.dart';
import 'product_list.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories = ["candy", "cake", "drink", "other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh Mục Sản Phẩm'),
        backgroundColor: Colors.green,
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
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Icon(Icons.category, color: Colors.green),
              title: Text(category, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(category: category)));
              },
            ),
          );
        },
      ),
    );
  }
}
