import 'package:DevBlog/screens/util_screens/full_screen_image.dart';
import 'package:DevBlog/widgets/blog_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/userImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FullScreenImage('assets/images/userImage.png'),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipi',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return BlogCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
