import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostRepository {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse("$baseUrl/posts"),
      // using header so request don't fail due to missing header or something
      headers: {
        'Accept': 'application/json',
        'User-Agent': 'Mozilla/5.0', // Mimic a browser
      },
    );
    developer.log('Response body: \\n${response.body}', name: 'PostRepository');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      developer.log(
        'Decoded data type: \\n${data.runtimeType}',
        name: 'PostRepository',
      );
      for (var item in data) {
        developer.log(
          'Item type: \\n${item.runtimeType}',
          name: 'PostRepository',
        );
      }
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      developer.log(
        'Failed to load posts. Status code: ${response.statusCode}',
        name: 'PostRepository',
        level: 1000,
      );
      throw Exception("Failed to load posts");
    }
  }
}
