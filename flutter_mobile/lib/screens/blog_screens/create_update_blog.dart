import 'dart:io';

import 'package:DevBlog/services/user_services.dart';
import 'package:DevBlog/utils/util_func.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateUpdateBlogScreen extends StatefulWidget {
  @override
  _CreateUpdateBlogScreenState createState() => _CreateUpdateBlogScreenState();
}

class _CreateUpdateBlogScreenState extends State<CreateUpdateBlogScreen> {
  final _fabIconColor = Colors.white;
  File _selectedFile;
  String _res;
  bool _isLoading = false;
  bool _inProcess = false;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  _selectImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    PickedFile image = await ImagePicker().getImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(
          ratioX: 1,
          ratioY: 1,
        ),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.deepOrange,
          toolbarTitle: "Crop Image",
          statusBarColor: Colors.deepOrange.shade900,
          backgroundColor: Colors.white,
        ),
      );

      this.setState(() {
        _selectedFile = cropped;
        // _selectedFile = File(image.path);
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  void getToken() async {
    setState(() {
      _isLoading = true;
    });
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _res = prefs.getString("token");
    });
    print(_res);
  }

  Future<void> _uploadImage() async {
    if (_selectedFile != null) {
      await UserService.updateProfilePicture(_selectedFile, _res).then(
        (value) {
          if (value) {
            UtilityFunction.showSnackbar(
                context, "Profile picture updated successfully", true);
            Navigator.pop(context);
          } else {
            UtilityFunction.showSnackbar(
                context, "Error updating profile picture", false);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Blog'),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: GestureDetector(
                child: _selectedFile != null
                    ? Stack(
                        children: [
                          Image.file(_selectedFile),
                          Positioned(
                            right: 0.0,
                            child: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  _selectedFile = null;
                                });
                              },
                            ),
                          )
                        ],
                      )
                    : Image.asset('assets/images/placeholder.jpg'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Select Image'),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _selectImage(ImageSource.camera);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  Text(' Camera'),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _selectImage(ImageSource.gallery);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.photo_library,
                                    color: Colors.white,
                                  ),
                                  Text(' Gallery'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            TextField(
              maxLength: 255,
              maxLines: null,
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
