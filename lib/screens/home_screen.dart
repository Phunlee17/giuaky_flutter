import 'package:flutter/material.dart';
import 'package:giuaky_maiphuong/screens/login_screen.dart';
import 'admin_info.dart';
import 'product_page.dart';
import 'category_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Chủ Admin'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.account_circle), text: 'Quản Lý Admin'),
            Tab(icon: Icon(Icons.shopping_cart), text: 'Quản Lý Sản Phẩm'),
            Tab(icon: Icon(Icons.category), text: 'Quản Lý Danh Mục'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Đăng xuất và điều hướng về màn hình đăng nhập
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AdminInfo(),
          ProductPage(),
          CategoryPage(),
        ],
      ),
    );
  }
}