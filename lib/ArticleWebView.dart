import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget{
  final url;
  ArticleWebView({Key key, @required this.url});
  ArticleWebViewState createState() => ArticleWebViewState(url);
}

class ArticleWebViewState extends State<ArticleWebView>{

  String url;
  ArticleWebViewState(String url){
    this.url = url;
  }

  int stackIndex = 1;
  var _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("In The Loop"),
      ),
      body: Column(children: <Widget>[
        new Expanded(
          child: IndexedStack(
            index: stackIndex,
            children: <Widget>[
              WebView(
                key: _key,
                initialUrl: url,
                onPageFinished: _handleLoad,
                javascriptMode: JavascriptMode.unrestricted,
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                  )
                ),
              )
            ],
          ),
        )
      ],),
    );
  }

  void _handleLoad(String value){
    setState(() {
      stackIndex = 0;
    });
  }

}