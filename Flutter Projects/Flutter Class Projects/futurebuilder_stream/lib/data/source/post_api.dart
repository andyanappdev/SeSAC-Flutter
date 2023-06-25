import 'dart:convert';
import 'package:futurebuilder_stream/domain/post.dart';
import 'package:http/http.dart' as http;

class PostApi {
  // FutureBuilder 연습문제 1
  Future<Post> getPost(int id) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    return Post.fromJson(jsonDecode(response.body));
  }

  // FutureBuilder 연습문제 2
  Future<List<Post>> getPosts() async {
    await Future.delayed(Duration(seconds: 3));

    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    Iterable jsonArray = jsonDecode(response.body);

    return jsonArray.map((e) => Post.fromJson(e)).toList();
  }
}
