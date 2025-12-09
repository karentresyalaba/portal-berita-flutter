class NewsModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final String category;
  final DateTime publishedAt;
  final String author;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.category,
    required this.publishedAt,
    required this.author,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map, String id) {
    return NewsModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
      publishedAt: DateTime.parse(map['publishedAt']),
      author: map['author'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'imageUrl': imageUrl,
      'category': category,
      'publishedAt': publishedAt.toIso8601String(),
      'author': author,
    };
  }
}