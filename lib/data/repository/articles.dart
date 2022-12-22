import 'dart:developer';

import 'package:news_app/constants.dart';
import 'package:news_app/data/data_provider/articles.dart';
import 'package:news_app/models/article.dart';

class ArticlesRespository {
  static Future<List<Article>> getArticles(int index) async {
    ArticleProvider _provider = ArticleProvider();

    final List response = await _provider.fetchArticles(getQuery(index));
    List<Article> articles = response.map((e) => Article.fromJson(e)).toList();

    return articles;
  }

  static String getQuery(int index) {
    String query;
    switch (index) {
      case 0:
        query = "/top-headlines?country=in&apiKey=$apiKey";
        break;

      case 1:
        query = "/top-headlines?category=sports&country=in&apiKey=$apiKey";
        break;

      case 2:
        query = "/top-headlines?category=business&country=in&apiKey=$apiKey";
        break;

      default:
        query =
            "/everything?q=india&from=2022-12-19&sortBy=popularity&apiKey=$apiKey";
    }

    return query;
  }
}
