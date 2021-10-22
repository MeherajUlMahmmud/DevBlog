import 'dart:convert';
import 'package:http/http.dart';

import 'package:DevBlog/models/api_response.dart';
import 'package:DevBlog/models/blog.dart';

class BlogService {
  List<Blog> _blogs = [];

  Future<APIResponse<List<Blog>>> getBlogs() async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      for (var item in jsonData) {
        _blogs.add(Blog.fromJson(item));
      }
      return APIResponse(
          true, _blogs, "Successfully fetched data", response.statusCode);
    }
    return APIResponse(false, null, "An error occured", response.statusCode);
  }
}
