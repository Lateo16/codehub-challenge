import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadNews extends StatefulWidget {
  @override
  _ReadNewsState createState() => _ReadNewsState();
  final String imageUrl, articleTitle, text, publisher;

  ReadNews({Key key,@required this.imageUrl, @required this.articleTitle, @required this.text, @required this.publisher}): super(key:key);
}

class _ReadNewsState extends State<ReadNews> {
 
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articleTitle, style: TextStyle(color: Colors.black, fontSize: 18),),
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Column(
         children: <Widget>[
           Container(
             margin: EdgeInsets.only(top:5.0),
            height: 150,
            width: ScreenUtil().setWidth(390),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.fill,), 
           ),
           Container(
             
             margin: EdgeInsets.only(left:20.0, right:20.0, top:25.0),
             child: Column(
               children: <Widget>[
                 Text(
                   widget.articleTitle,
                   style: TextStyle(fontWeight: FontWeight.bold,), ),
                   SizedBox(height:5.0),
                   Text(
                     widget.publisher,
                     style: TextStyle(fontWeight: FontWeight.normal, fontSize: 8.0),
                   ),
                   SizedBox(
                     height: 10.0,
                   ),
                   Text(
                     widget.text,
                     style: TextStyle(fontSize: 12.0),
                   ) 
               ],
             ),
           )
         ], 
        ),
      ),
    );
  }
}