import 'package:google_auth/models/news_article.dart';

class NewsResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<NewsArticle> articles;

  NewsResponse({
    required this.count,
    this.next,
    this.previous,
    required this.articles,
  });
}
