import 'package:flutter/material.dart';
import 'package:flutter_mobile/screens/blog_screens/create_update_blog.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _fabIconColor = Colors.white;
  final _bottomNavIconColor = Colors.grey;

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevBlog'),
        elevation: 0.0,
      ),
      body: Scaffold(
        body: Center(
          child: Text('MainScreen'),
        ),
      ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return CreateUpdateBlogScreen();
              }));
            },
            tooltip: '',
            child: Icon(
              Icons.add,
              color: _fabIconColor,
            )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined),
              color: _bottomNavIconColor,
              onPressed: (){
                setState(() {
                  _index = 0;
                });
              }
            ),
            IconButton(
              icon: Icon(Icons.category_outlined),
              color: _bottomNavIconColor,
              onPressed: (){
                setState(() {
                  _index = 1;
                });
              }
            ),
            IconButton(
              icon: Icon(Icons.search_outlined),
              color: _bottomNavIconColor,
              onPressed: (){
                setState(() {
                  _index = 2;
                });
              }
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              color: _bottomNavIconColor,
              onPressed: (){
                setState(() {
                  _index = 3;
                });
              }
            )
          ]
        )
      )
    );
  }
}
