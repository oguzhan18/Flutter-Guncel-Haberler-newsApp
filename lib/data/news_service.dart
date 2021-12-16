import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsApp/models/article.dart';
import 'package:newsApp/models/news.dart';

class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }

  static Future<List<Articles>> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=0add4753f7b54ecf89300cf982152cdb';

    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
