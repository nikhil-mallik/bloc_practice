import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/post_item_model.dart';

class PostRepo {
  /// Asynchronous method to fetch a list of posts.
  Future<List<PostModel>> fetchPost() async {
    try {
      // Make a GET request to fetch posts from the API
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Decode the JSON response body into a List
        final body = json.decode(response.body) as List;
        // Map each item in the List to a PostModel object and return a List of PostModel
        return body.map((e) {
          return PostModel(
            postId: e['postId'] as int,
            id: e['id'] as int,
            name: e['name'] as String,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      // Handle SocketException - network error
      throw Exception('Error while fetching data');
    } on TimeoutException {
      // Handle TimeoutException - request time out
      throw Exception('Request time out. Try Again');
    }
    // Throw an exception if fetching data was not successful
    throw Exception('Error while fetching data');
  }
}
