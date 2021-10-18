import 'package:DevBlog/screens/blog_screens/blog_details.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatefulWidget {
  // final String title;
  // final String image;
  // final String date;
  // final String author;
  // final String datePosted;
  // BlogCard({
  //   this.title,
  //   this.image,
  //   this.date,
  //   this.author,
  //   this.datePosted,
  // });

  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailsScreen(id: 1),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'This is the blog title',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Author',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.network(
                      'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=100&q=60',
                      height: 80,
                      width: 100,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Date Posted',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
