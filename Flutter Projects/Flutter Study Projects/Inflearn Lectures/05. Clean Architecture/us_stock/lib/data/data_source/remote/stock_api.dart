import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StockApi {
  static const baseUrl = 'https://www.alphavantage.co';
  static const interval = '60min';

  // Client 정의 (test code 작성 및 client 교체를 위해서)
  final http.Client _client;

  StockApi({http.Client? client}) : _client = (client ?? http.Client());

  // Company List API call
  Future<http.Response> getListings() async {
    final apiKey = dotenv.get('apiKey');
    return await _client.get(
        Uri.parse('$baseUrl/query?function=LISTING_STATUS&apikey=$apiKey'));
  }

  // Company Info API call
  Future<http.Response> getCompanyInfo({required String symbol}) async {
    final apiKey = dotenv.get('apiKey');
    return await _client.get(Uri.parse(
        '$baseUrl/query?function=OVERVIEW&symbol=$symbol&apikey=$apiKey'));
  }

  // Company Intraday API call
  Future<http.Response> getIntraday({required String symbol}) async {
    final apiKey = dotenv.get('apiKey');
    return await _client.get(Uri.parse(
        '$baseUrl/query?function=TIME_SERIES_INTRADAY&symbol=$symbol&interval=$interval&apikey=$apiKey&datatype=csv'));
  }
}
