import 'package:DevBlog/screens/blog_screens/blog_home.dart';
import 'package:DevBlog/screens/blog_screens/categories_screen.dart';
import 'package:DevBlog/screens/blog_screens/create_update_blog.dart';
import 'package:DevBlog/screens/blog_screens/search_blog_screen.dart';
import 'package:DevBlog/screens/user_screens/profile_screen.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _fabIconColor = Colors.white;
  final _bottomNavIconColor = Colors.grey;

  int _currentIndex = 0;
  final List _children = [
    BlogHomeScreen(),
    CategoriesScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevBlog'),
        centerTitle: true,
      ),
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return CreateUpdateBlogScreen();
          }));
        },
        tooltip: 'Write New Blog',
        child: Icon(
          Icons.edit_rounded,
          color: _fabIconColor,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: _bottomNavIconColor,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile')
        ],
      ),
    );
  }
}
