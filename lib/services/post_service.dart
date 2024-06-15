// Post_Service.dart inside hte service folder

import "dart:convert";
import "package:hello_flutter/models/post_model.dart";
import "package:http/http.dart" as http;

class PostService {
  static Future<List<Post>> getAllPosts() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {

// I get a string from the api endpoint 
// I convert that string to json payload and typed as a List of dynmic
// use the cast (HOF) to declaer the elements of the list as a Map<String, dynamic>
// Map  through the items in the list 

      return (jsonDecode(response.body) as List)
          .cast<Map<String, dynamic>>()
          .map(Post.fromJson) //Method refernec
          .toList();
    } else {
      throw Exception("Failed to get all posts");
    }
  }
}
