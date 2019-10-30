import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_the_loop/Model/NewsResponse.dart';
import 'package:flutter_in_the_loop/Networking.dart';

import 'ArticleWebView.dart';

class SearchResults extends StatefulWidget{
  SearchResultsState createState()=>SearchResultsState();
}

class SearchResultsState extends State<SearchResults>{
  TextEditingController searchController = TextEditingController();
  Networking networking = new Networking();
  var articles = new List<Article>();
  bool isLoading = true;
  bool isSearching = true;


  @override
  void initState() {
    super.initState();
  }

  getArticles(String search)async{
    await networking.searchNews(search).then((response){
      setState(() {
        articles = response.articles;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: searchController,
          onSubmitted: (text)=> {
            setState(() {
              isSearching = true;
            }),
            getArticles(text),
            setState(() {
              isSearching = false;
            }),
          },
          decoration: InputDecoration(
            hintText: "Search",
            icon: Icon(Icons.search)
          ),
        ),
      ),
      body: isLoading? Container(
        color: Colors.white,
        child: Center(
            child: Text("Search something to get started", style: TextStyle(fontSize: 32),textAlign: TextAlign.center,)
        ),
      ):isSearching? Container(
        color: Colors.white,
        child: Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            )
        ),
      ): Container(
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return  InkWell(
                onTap: ()=> goToArticle(articles[index].url),
                child: Padding(
                    padding: EdgeInsets.only(right: 16, top: 8, left: 16, bottom: 24),
                    child: Column(children: <Widget>[
                      new ClipRRect(
                        borderRadius: new BorderRadius.circular(10),
                        child: articles[index].urlToImage != null?Image.network(articles[index].urlToImage,
                        ): Container(),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(articles[index].title != null?articles[index].title: "" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),),),
                      Row(
                        children: <Widget>[
                          Text(articles[index].source.name!= null?articles[index].source.name: ""),
                          Expanded(child: Container()),
                          Text(articles[index].author!= null?articles[index].author: "")
                        ],
                      )
                    ],))
            );
          },
        ),
      ),
    );
  }

  goToArticle(String url){
    Navigator.push(context, MaterialPageRoute(maintainState: false, builder: (context) => ArticleWebView(url: url,)));
  }

}