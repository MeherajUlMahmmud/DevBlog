import 'package:DevBlog/widgets/blog_card.dart';
import 'package:DevBlog/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // create a horizontal list view
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ListView(
          children: [
            Container(
              height: 40.0,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CategoryTile(
                    title: 'React.js',
                  ),
                  CategoryTile(
                    title: 'Django',
                  ),
                  CategoryTile(
                    title: 'AI',
                  ),
                  CategoryTile(
                    title: 'Python',
                  ),
                  CategoryTile(
                    title: 'Java',
                  ),
                  CategoryTile(
                    title: 'Node.js',
                  ),
                  CategoryTile(
                    title: 'Redis',
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 70,
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
          ],
        ),
      ),
    );
  }
}
