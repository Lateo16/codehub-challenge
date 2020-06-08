import 'package:apis/read_news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apis/articles.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'News'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var isLoading = true;
  
  var list;

// A function that reads articles from the api 
  _fetchData() async {
    final response = await http.get("https://learnappmaking.com/ex/news/articles/Apple?secret=CHWGk3OTwgObtQxGqdLvVhwji6FsYm95oe87o3ju");
    if (response.statusCode == 200 ) {
      //  list = (jsonDecode(response.body) as List).map((data) => new Articles.fromJson(data))
      //         .toList();
      list =   new Articles.fromJson(response.body);
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception("failed to load photos");
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator()
      ) 
      :ListView.builder(
        // using a listview builder to display the api data we 
        // read from
        padding: EdgeInsets.only(left: 10.0),
        itemCount: list.count,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text(
                list.article[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(list.article[index].publisher),
              trailing: Icon(
                Icons.arrow_forward_ios
              ),
              onTap: () {
                // navigating to a specific article detail 
                // when the article list tile is tapped
                Navigator.push( context, MaterialPageRoute(builder: (context) => ReadNews(
                  imageUrl: list.article[index].image, 
                  articleTitle: list.article[index].title, 
                  text: list.article[index].text, 
                  publisher: list.article[index].publisher)));
              },
            ),
            // elevation: 0.1,
          );
      })
    );
  }
}
