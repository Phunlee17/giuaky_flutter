import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminInfo extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.account_circle, size: 50),
          ),
          SizedBox(height: 20),
          Text(
            'Thông Tin Admin',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Email: ${user?.email ?? "Chưa đăng nhập"}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'UID: ${user?.uid ?? "Không có UID"}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
