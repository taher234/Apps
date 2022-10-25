import 'sourceModel.dart';

class Articles {
  Source? source;
  String? title, description, url, urlImage, content, publishedAt;
  Articles({
    required this.source,
    required this.title,
    required this.description,
    required this.url,
    required this.urlImage,
    required this.content,
    required this.publishedAt,
  });
  factory Articles.fromJson(Map<String, dynamic> data) {
    return Articles(
      source: Source.fromJson(data['source']),
      content: data['content'],
      publishedAt: data['publishedAt'],
      title: data['title'],
      description: data['description'],
      urlImage: data['urlToImage'],
      url: data['url'],
    );
  }
}
