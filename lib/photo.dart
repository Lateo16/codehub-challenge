import 'dart:convert';

import 'package:apis/articles.dart';

class Photo {
  int count;
  List<Articles> article;

  // Photo._({this.count, this.url, this.title, this.text});

  Photo.fromJson(String json) {
    final _map = jsonDecode(json);
    count = _map['count'];
    article = [];

    final _articlesList = _map['articles'];
    for (var i=0;i< count; i++) {
      article.add(new Articles.fromJson(_articlesList[i]));
    }
  }
}