import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_in_the_loop/Constants.dart';
import 'package:flutter_in_the_loop/Model/NewsResponse.dart';

class Networking {
  Future<NewsResponse> getCategoryNews(String category) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("https://newsapi.org/v2/top-headlines", queryParameters: {"country": "us", "category": category, "pageSize": 100, "apiKey": APIKEY});
    var temp = response.toString();
    print(temp);

    var responseObject = jsonDecode(response.toString());
    var newsResponse = NewsResponse.fromJson(responseObject);

    print(newsResponse);
    return newsResponse;
  }
}