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
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text('My Blogs'),
      ),
    );
  }
}
