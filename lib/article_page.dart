import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:share/share.dart';

//TODO: 1.Spinner, 2) unescape with dart class
// 3. futurebuilder.
class DetailScreen extends StatelessWidget {
  // parse the json with a post class
  final dynamic post;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final unescape = new HtmlUnescape();
    final _title = unescape.convert(post["title"]["rendered"]);
    final _content = unescape.convert(post["content"]["rendered"]);
    final _shareLink = post["link"];
    final _shareMessage = "Check out this article '$_title'\n$_shareLink";
    return Scaffold(
      appBar: AppBar(
          title: Text("Black Tax White Benefits"),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.share),
              onPressed: () => Share.share(_shareMessage),
            ),
          ]),
      body: SingleChildScrollView(
          child: Column(
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
                      _title,
                      // textAlign: TextAlign.justify,
                      style: new TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    )),
                new Padding(
                  padding: EdgeInsets.all(4.0),
                  child: new HtmlView(data: _content),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
