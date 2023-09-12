import 'package:dust_forecast/models/AirResult.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AirvisualApiProvider {
  final _baseUrl = 'https://api.airvisual.com/v2/';

  Future<AirResult> fetchAirResult() async {
    final response = await http.get(Uri.parse(
        '${_baseUrl}nearest_city?key=${dotenv.get('airvisualApiKey')}'));

    if (response.statusCode != 200) {
      throw StateError('Network Error status code : ${response.statusCode}');
    }

    var json = convert.jsonDecode(response.body);
    return AirResult.fromJson(json);
  }
}
