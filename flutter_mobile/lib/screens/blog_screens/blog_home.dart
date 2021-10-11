import 'package:DevBlog/widgets/blog_card.dart';
import 'package:flutter/material.dart';

class BlogHomeScreen extends StatefulWidget {
  @override
  _BlogHomeScreenState createState() => _BlogHomeScreenState();
}

class _BlogHomeScreenState extends State<BlogHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
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
      ),
    );
  }
}
