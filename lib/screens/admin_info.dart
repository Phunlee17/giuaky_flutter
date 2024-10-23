import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminInfo extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông Tin Admin',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Thêm kiểu chữ cho tiêu đề
        ),
        backgroundColor: Colors.green, // Thêm màu nền cho AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green, // Màu nền cho CircleAvatar
              child: Icon(Icons.account_circle, size: 50, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Thông Tin Admin',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Email: ${user?.email ?? "Chưa đăng nhập"}',
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'UID: ${user?.uid ?? "Không có UID"}',
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
