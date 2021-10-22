import 'dart:convert';
import 'dart:io';

import 'package:DevBlog/models/api_response.dart';
import 'package:DevBlog/models/user.dart';
import 'package:DevBlog/utils/constants.dart';
import 'package:DevBlog/utils/user_preference.dart';
import 'package:http/http.dart';

class UserService {
  Future<APIResponse<UserProfile>> loginUser(
      String email, String password) async {
    Uri url = Uri.parse(Constants.loginUrl);

    try {
      final response = await post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({"email": email, "password": password}),
      );
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        // print(response.body);
        User user = User.fromJson(data['user']);
        print(user.toJson());
        Profile profile = Profile.fromJson(data['profile']);
        print(profile.toJson());

        UserProfile userProfile = UserProfile(user: user, profile: profile);

        UserPreferences().saveUserInformation(userProfile);

        return APIResponse(
            true, userProfile, "Login Successful", response.statusCode);
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

  Future<APIResponse> registerUser(
      String name, String email, String password) async {
    Uri url = Uri.parse(Constants.registerUrl);

    try {
      final response = await post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({"name": name, "email": email, "password": password}),
      );
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        return APIResponse(
            true, null, "Registration Successful", response.statusCode);
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
}
