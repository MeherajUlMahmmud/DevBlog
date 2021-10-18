import 'dart:convert';
import 'dart:io';

import 'package:DevBlog/models/api_response.dart';
import 'package:DevBlog/models/user.dart';
import 'package:DevBlog/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService with ChangeNotifier {
  static Future<APIResponse<User>> loginUser(
      String email, String password) async {
    Uri url = Uri.parse(Constants.loginUrl);

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({"email": email, "password": password}),
      );
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        // print(response.body);
        User user = User.fromJson(json.decode(response.body));
        // print(user.token);

        Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
        final SharedPreferences prefs = await _prefs;
        prefs.setString("token", user.token);
        return APIResponse(
            true, user, "Login Successful", response.statusCode);
      } else {
        print(response.body);
        return APIResponse(false, null, data['error'], response.statusCode);
      }
    } on SocketException {
      return APIResponse(false, null, "No Internet Connection", 400);
    } on FormatException {
      return APIResponse(false, null, "Invalid Response", 400);
    } catch (e) {
      return APIResponse(false, null, "Error Occurred", 400);
    }
  }

  static Future<bool> registerUser(
      String name, String email, String password) async {
    Uri url = Uri.parse(Constants.registerUrl);

    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({"name": name, "email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      User user = User.fromJson(json.decode(response.body));
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      prefs.setString("token", user.token);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  static Future<dynamic> getUserDetails(String token) async {
    // print("inside user service" + token);
    dynamic userData = [];
    Uri url = Uri.parse(Constants.getUserDetailsUrl);

    http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token " + token,
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      userData = json.decode(response.body);
      print(userData['user']);
      print(userData['profile']);
      return userData;
    } else {
      print(response.body);
      return userData;
    }
  }

  static Future<bool> updateUserInfo(
      String name, String email, String token) async {
    Uri url = Uri.parse(Constants.updateUserInfoUrl);
    http.Response response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token " + token,
      },
      body: json.encode({"name": name, "email": email}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  static Future<bool> updateUserProfile(
      String phone, String address, String token) async {
    Uri url = Uri.parse(Constants.updateProfileInfoUrl);
    http.Response response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token " + token,
      },
      body: json.encode({"phone": phone, "address": address}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  static Future<bool> updateProfilePicture(File imageFile, String token) async {
    Uri url = Uri.parse(Constants.updateProfileImageUrl);
    String base64file = base64Encode(imageFile.readAsBytesSync());
    String fileName = imageFile.path.split("/").last;
    Map data = {};
    data['name'] = fileName;
    data['file'] = base64file;

    http.Response response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token " + token,
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  static Future<bool> updatePassword(
      String oldPassword, String newPassword, String token) async {
    Uri url = Uri.parse(Constants.updatePasswordUrl);
    http.Response response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token " + token,
      },
      body: json
          .encode({"old_password": oldPassword, "new_password": newPassword}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}
