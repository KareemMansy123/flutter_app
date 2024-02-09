import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_response.dart';

class RemoteService {
  Future<List<Article>> fetchNews(double lat, double lng) async {
    var url = Uri.parse('');
    var request = http.Request("GET", url);

    var response = await NetworkLogger.logRequest(request);

    if (response.statusCode == 200) {
      return parseData(response.body);
    } else {
      throw Exception('Failed to load mosques');
    }
  }

  List<Article> parseData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Article>((json) => Article.fromJson(json)).toList();
  }
}
class NetworkLogger {
  static Future<http.Response> logRequest(http.Request request) async {
    print("Request URL: ${request.url}");
    print("Request Method: ${request.method}");
    print("Request Headers: ${request.headers}");
    if (request.body.isNotEmpty) {
      print("Request Body: ${request.body}");
    }

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    return response;
  }
}