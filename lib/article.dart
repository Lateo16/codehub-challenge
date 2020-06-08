class Article {
  /**
   * Article class defines a model to represent the features of an article
   * read from the api end point.
   */
  final String id,url,title,text,publisher,author,image,date;

  Article({this.id, this.url, this.author, this.date, this.image, this.publisher, this.text, this.title});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      url: json['url'],
      author: json['author'],
      date: json['date'],
      image: json['image'],
      publisher: json['publisher'],
      text: json['text'],
      title: json['title']
    );
  }
}