import 'package:DevBlog/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UtilService with ChangeNotifier {
  static Future<bool> sendFeedback(
      String name, String email, String subject, String message) async {
    Uri feedbackUrl = Uri.parse(Constants.sendFeedbackUrl);
    http.Response response = await http.post(feedbackUrl, body: {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
