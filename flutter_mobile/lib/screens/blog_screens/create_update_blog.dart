import 'package:flutter/material.dart';

class CreateUpdateBlogScreen extends StatefulWidget {
  @override
  _CreateUpdateBlogScreenState createState() => _CreateUpdateBlogScreenState();
}

class _CreateUpdateBlogScreenState extends State<CreateUpdateBlogScreen> {
  final _fabIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Blog'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              maxLength: 255,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8F8F8F),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            // image chooser
            TextField(
              decoration: InputDecoration(
                hintText: 'Image URL',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8F8F8F),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.save,
          color: _fabIconColor,
        ),
      ),
    );
  }
}
