class Articles {
  final String id,url,title,text,publisher,author,image,date;

  Articles({this.id, this.url, this.author, this.date, this.image, this.publisher, this.text, this.title});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
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