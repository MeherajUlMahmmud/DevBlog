import 'package:flutter/material.dart';

class MyBlogsScreen extends StatefulWidget {
  @override
  _MyBlogsScreenState createState() => _MyBlogsScreenState();
}

class _MyBlogsScreenState extends State<MyBlogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Blogs'),
      ),
      body: Center(
        child: Text('My Blogs'),
      ),
    );
  }
}
