import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatefulWidget {
  final int id;
  BlogDetailsScreen({this.id});

  @override
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Details'),
      ),
      body: Container(
        child: Text('Blog Details'),
      ),
    );
  }
}
