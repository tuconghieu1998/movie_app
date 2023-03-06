import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../core/model/post.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static final Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  static List<Post> parsePost(String responseBody) {
    print(responseBody);
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      return compute(parsePost, response.body);
    }
    else if(response.statusCode == 404) {
      throw Exception("Not Found");
    }
    else {
      throw Exception("Can't get posts");
    }
  }
}