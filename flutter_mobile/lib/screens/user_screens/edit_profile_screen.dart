import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // circular image
            Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage('assets/images/userImage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: 160,
                    ),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      child: TextField(
                        maxLines: null,
                        onChanged: (String txt) {},
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Color(0xFF313A44),
                        ),
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: 160,
                    ),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      child: TextField(
                        maxLines: null,
                        onChanged: (String txt) {},
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Color(0xFF313A44),
                        ),
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: 160,
                    ),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      child: TextField(
                        maxLines: null,
                        onChanged: (String txt) {},
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Color(0xFF313A44),
                        ),
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // update button
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          offset: const Offset(4, 4),
                          blurRadius: 8),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
