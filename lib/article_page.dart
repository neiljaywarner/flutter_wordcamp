import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class DetailScreen extends StatelessWidget {
  // parse the json with a post class
  final dynamic post;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Black Tax White Benefits"),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.share),
              onPressed: () {
                print("***TODO:Share");
              },
            ),
          ]
      ),
      body:
          Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: (post["_embedded"]["wp:featuredmedia"][0]
                      ["source_url"]),
                    ),

                    new Padding(
                        padding: EdgeInsets.all(8.0),

                        child: new Text(
                          post["title"]["rendered"],
                          // textAlign: TextAlign.justify,
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                    ),
                    new Padding(
                      padding: EdgeInsets.all(4.0),
                      child: new HtmlView(
                          data: post["content"]["rendered"]),
                    ),

                  ],
                ),
              )
            ],
          ));
  }
}
