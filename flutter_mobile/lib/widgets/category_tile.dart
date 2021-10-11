import 'package:DevBlog/screens/blog_screens/categorized_blogs.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  final String title;
  CategoryTile({
    this.title,
  });

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 10),
        height: 40,
        // create a circular box with black background
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategorizedBlogScreen(
              category: widget.title,
            ),
          ),
        );
      },
    );
  }
}
