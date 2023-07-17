import 'dart:convert';

import 'package:image_search/domain/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '38286837-4dd42efa00b62bbc0137718e6';

  Future<List<Photo>> fetch(String query) async {
    final response = await http
        .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
