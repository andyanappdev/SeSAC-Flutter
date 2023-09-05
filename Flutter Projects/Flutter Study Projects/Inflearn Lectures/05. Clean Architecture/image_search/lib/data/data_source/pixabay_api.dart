import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/result.dart';

class PixabayApi {
  static const baseUrl = 'https://pixabay.com/api/';
  final key = dotenv.get('key');
  final http.Client client;

  PixabayApi(this.client);

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client
          .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits);
    } catch (e) {
      // error 처리 코드
      return const Result.error('Network Error');
    }
  }
}
