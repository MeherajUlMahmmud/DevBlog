import 'package:DevBlog/models/blog.dart';
import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatefulWidget {
  final int id;
  BlogDetailsScreen({this.id});

  @override
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  bool _isLoading = false;
  Blog _blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Details'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Container(
                    child: Text(
                      "This is blog title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 250,
                    child: Image.asset('assets/images/placeholder.jpg'),
                  ),
                  SizedBox(height: 5),
                  // author
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Author",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      // posted on
                      Container(
                        child: Text(
                          "Posted on",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Text(
                      "This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. This is blog content. ",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
