class Article {
  late Source source;
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  Article.fromJson(Map<String, dynamic> json) {
    source = new Source.fromJson(json['source']);
    author = json['author'] ?? "NA";
    title = json['title'] ?? 'NA';
    description = json['description'] ?? "NA";
    url = json['url'] ?? "NA";
    urlToImage = json['urlToImage'] ??
        "https://cdn.pixabay.com/photo/2013/07/12/19/16/newspaper-154444_960_720.png";
    publishedAt = json['publishedAt'] ?? "NA";
    content = json['content'] ?? "NA";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  late String id;
  late String name;

  Source({required this.id, required this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "NA";
    name = json['name'] ?? "NA";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
