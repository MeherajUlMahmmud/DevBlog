import 'package:DevBlog/widgets/blog_card.dart';
import 'package:flutter/material.dart';

class CategorizedBlogScreen extends StatefulWidget {
  final String category;
  CategorizedBlogScreen({this.category});

  @override
  _CategorizedBlogScreenState createState() => _CategorizedBlogScreenState();
}

class _CategorizedBlogScreenState extends State<CategorizedBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
          BlogCard(),
        ],
      ),
    );
  }
}
