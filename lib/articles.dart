import 'dart:convert';

import 'package:apis/article.dart';

class Articles {
  /*
    Articles class defines a model that represents how the 
    api we are reading from is defined.
   */
  int count;
  List<Article> article;

  Articles.fromJson(String json) {
    // converts the data read read from the api
    // from json to specific data types
    final _map = jsonDecode(json);
    count = _map['count'];
    article = [];

    final _articlesList = _map['articles'];
    for (var i=0;i< count; i++) {
      article.add(new Article.fromJson(_articlesList[i]));
    }
  }
}