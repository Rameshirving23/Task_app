import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newsapiapp/constants/Strings.dart';
import 'package:newsapiapp/model/newsInfo.dart';

class API_Manager{
  Future<NewsModel> getNews() async{
    var client = http.Client();
    var newsModel = null;

    try{
      var response = await client.get(Strings.news_api);
      var response2 = await client.get(Strings.news_api2);
      var response3 = await client.get(Strings.news_api3);

      if(response.statusCode == 200 && response2.statusCode == 200 && response3.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    }catch(Exception){
      return newsModel;
    }

    return newsModel;
  }
}

class API_Manager2{
  Future<NewsModel> getNews() async{
    var client = http.Client();
    var newsMode2 = null;


    try{
      var response2 = await client.get(Strings.news_api2);

      if(response2.statusCode == 200){
        var jsonString2 = response2.body;
        var jsonMap2 = jsonDecode(jsonString2);

        newsMode2 = NewsModel.fromJson(jsonMap2);
      }
    }catch(Exception){
      return newsMode2;
    }

    return newsMode2;
  }
}

class API_Manager3{
  Future<NewsModel> getNews() async{
    var client = http.Client();

    var newsMode3 = null;

    try{

      var response3 = await client.get(Strings.news_api3);

      if(response3.statusCode == 200){
        var jsonString3 = response3.body;
        var jsonMap3 = jsonDecode(jsonString3);

        newsMode3 = NewsModel.fromJson(jsonMap3);
      }
    }catch(Exception){
      return newsMode3;
    }

    return newsMode3;
  }
}

