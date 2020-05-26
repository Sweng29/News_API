import 'dart:convert';

import 'package:newsapi/models/articles.dart';
import 'package:http/http.dart' as http;

class NewsManager{

  List<Article> articleList = [];
  String url = 'http://newsapi.org/v2/top-headlines?country=gb&apiKey=f36db7c45d4342a880d9e3c4742a1968';

  Future<void> fetchTopBusinessNews() async {

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
            content: element["content"],
            url: element["url"],
          );
          articleList.add(article);
        }
      });
    }
  }

}