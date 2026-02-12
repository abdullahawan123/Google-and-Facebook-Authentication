class NewsArticle {
  final String title;
  final String? url;
  final String? description;
  final String? urlToImage;
  final String? sourceName;
  final DateTime? publishedAt;

  NewsArticle({
    required this.title,
    this.url,
    this.description,
    this.urlToImage,
    this.sourceName,
    this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      url: json['url'],
      description: json['summary'],
      urlToImage: json['image_url'],
      sourceName: json['news_site'],
      publishedAt: json['published_at'] != null
          ? DateTime.tryParse(json['published_at'])?.toLocal()
          : null,
    );
  }
}
