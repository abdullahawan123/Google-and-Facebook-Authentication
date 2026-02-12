import 'package:flutter/material.dart';
import '../models/news_article.dart';
import '../services/api_service.dart';

class NewsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<NewsArticle> articles = [];
  String? _nextUrl;
  bool isLoading = false;
  bool isLoadingMore = false;
  String? error;

  bool get hasMore => _nextUrl != null;

  Future<void> fetchNews({bool loadMore = false}) async {
    if (isLoading || isLoadingMore) return;

    if (loadMore) {
      if (_nextUrl == null) return;
      isLoadingMore = true;
    } else {
      isLoading = true;
      articles.clear();
    }

    notifyListeners();

    try {
      final data = await _apiService.fetchArticles(
        url: loadMore ? _nextUrl : null,
      );

      final List results = data['results'];
      _nextUrl = data['next'];

      final newArticles = results.map((e) => NewsArticle.fromJson(e)).toList();

      articles.addAll(newArticles);
      error = null;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      isLoadingMore = false;
      notifyListeners();
    }
  }
}
