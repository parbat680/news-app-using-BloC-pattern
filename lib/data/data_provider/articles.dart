import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants.dart';
import 'package:news_app/data/data_provider/exceptions.dart';

class ArticleProvider {
  Future<dynamic> fetchArticles(String query) async {
    final http.Response response;

    try {
      response = await http.get(Uri.parse("$url$query"));
      if (response.statusCode != 200) {
        getException(response.statusCode);
      }
    } catch (e) {
      throw FormatException(error: e.toString());
    }

    return jsonDecode(response.body)['articles'] as List;
  }
}
