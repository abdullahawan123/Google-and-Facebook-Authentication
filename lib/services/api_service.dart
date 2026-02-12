import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      'https://api.spaceflightnewsapi.net/v4/articles/';

  Future<Map<String, dynamic>> fetchArticles({String? url}) async {
    final response = await http.get(Uri.parse(url ?? _baseUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to load news');
    }

    return json.decode(response.body);
  }
}
