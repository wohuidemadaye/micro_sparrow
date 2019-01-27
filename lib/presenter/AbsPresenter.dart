import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AbsPresenter{

  String cookie = "";
  String token = "";


  Future<Map<String, String>> _getWithTokenHeaders() async{
    if(token == null || token.isEmpty){
      SharedPreferences preferences = await SharedPreferences.getInstance();
      token = preferences.getString("token");
    }
    Map<String,String> hearders = new Map();
    hearders["Content-Type"] = "application/json";
    hearders["User-Agent"] = "sparrow";
    hearders["X-Auth-Token"] = token;
    return hearders;
  }

  Future<Map<String, String>> _getWithCookieHeaders() async{
    if(cookie == null || cookie.isEmpty){
      SharedPreferences preferences = await SharedPreferences.getInstance();
      cookie = preferences.getString("cookies");
    }
    Map<String,String> hearders = new Map();
    hearders["Content-Type"] = "application/x-www-form-urlencoded";
    hearders["User-Agent"] = "sparrow";
    hearders["cookie"] = cookie;
    return hearders;
  }


  ///
  /// 携带token的http请求封装
  ///
  Future<Map<String,dynamic>> getTokenHttpData(String api) async{
    Map<String,String> hearders;
    hearders = await _getWithTokenHeaders();
    http.Response response = await http.get(Uri.parse(api),
        headers: hearders);
    var result = json.decode(response.body);
    return result;
  }

  ///
  /// 携带cookie消息的http请求封装
  ///
  Future<Map<String,dynamic>> getCookieHttpData(String api) async{
    Map<String,String> hearders;
    hearders = await _getWithCookieHeaders();
    http.Response response = await http.get(Uri.parse(api),
        headers: hearders);
    var result = json.decode(response.body);
    return result;
  }

  ///
  /// http post方法
  ///
  Future<Map<String,dynamic>> postHttpData(String api,String body) async{
    Map<String,String> hearders;
    hearders = await _getWithTokenHeaders();
    http.Response response = await http.post(Uri.parse(api),
        body: body,
        headers: hearders);
    var result = json.decode(response.body);
    return result;
  }

  ///
  /// http put 方法
  ///
  Future<Map<String,dynamic>> putHttpData(String api,String body) async{
    Map<String,String> hearders;
    hearders = await _getWithTokenHeaders();
    http.Response response = await http.put(Uri.parse(api),
        body: body,
        headers: hearders);
    var result = json.decode(response.body);
    return result;
  }

  Future<Map<String,dynamic>> putHttpCsrfData(String api,String body) async{
    Map<String,String> hearders;
    hearders = await _getWithCookieHeaders();
    hearders['x-csrf-token'] = hearders["cookie"].split("ctoken=")[1].split(";")[0];
    http.Response response = await http.put(Uri.parse(api),
        body: body,
        headers: hearders);
    var result = json.decode(response.body);
    return result;
  }

  ///
  /// http delete 方法
  ///
  Future<Map<String,dynamic>> deleteHttpData(String api) async{
    Map<String,String> hearders;
    hearders = await _getWithTokenHeaders();
    http.Response response = await http.delete(Uri.parse(api),
        headers: hearders);
    var result = json.decode(response.body);
    return result;
  }

}