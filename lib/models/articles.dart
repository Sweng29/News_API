class Article{
  String urlToImage;
  String author;
  String title;
  String description;
  String url;
  String publishedAt;
  String content;
  String source;

  Article({this.urlToImage, this.author, this.title, this.description, this.url,
      this.publishedAt, this.content, this.source});

  Article.fromJson(Map<String, dynamic> json) {

    author = json['author'];
    content = json['content'];
    title = json['title'];
    description = json['description'];
    publishedAt = json['publishedAt'];
    source = json['publishedAt'];
    url = json['url'];
    urlToImage = json['urlToImage'];
  }
}