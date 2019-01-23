import 'dart:convert';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/Utils/SparrowException.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/IMainView.dart';
import 'package:micro_sparrow/model/Doc_entity.dart';
import 'package:micro_sparrow/model/EventEntity.dart';
import 'package:micro_sparrow/model/ThirdData_entity.dart';
import 'package:micro_sparrow/model/Token_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MainViewPresenter implements IPresenter{

  IMainView _view;
  String _cookie = "";
  String _token = "";
  bool _isExpire = false;

  @override
  init(IView view) {
    this._view = view;
  }

  Future<Null> readCookie() async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    _cookie = preferences.getString("cookies");
    return;
  }

  void getHistoryHttpData() async{
    if(_cookie == null){
      _view.resultOfEvent(false,null,SparrowException.GET_COOKIES_FAIL);
      return;
    }
    var result = await _getHttpData(Api.historyDoc);
    DocEntity docEntity = new DocEntity.fromJson(result);
    if(docEntity==null){
      _view.resultOfHistoryDoc(false,null,SparrowException.NETWORK_ERROR);
    }else if(docEntity.data == null){
      _view.resultOfHistoryDoc(false,null,SparrowException.NULL_DATA);
    }else{
      _view.resultOfHistoryDoc(true,docEntity,SparrowException.OK);
    }
  }

  void getEventHttpData() async{
    await readCookie();
    if(_cookie == ""){
      _view.resultOfEvent(false,null,SparrowException.GET_COOKIES_FAIL);
      return;
    }
    if(_cookie == null){
      _view.resultOfEvent(false,null,SparrowException.LOGIN);
      return;
    }
    var result = await _getHttpData(Api.event);
    EventEntity _event = new EventEntity.fromJson(result);
    if(_event==null){
      _view.resultOfEvent(false,null,SparrowException.NETWORK_ERROR);
    }else if(_event.data == null){
      _view.resultOfEvent(false,null,SparrowException.NULL_DATA);
    }else{
      _view.resultOfEvent(true,_event,SparrowException.OK);
    }
  }


  Future<Map<String,dynamic>> _getHttpData(String api) async{
    Map<String,String> hearders;
    hearders = _getHeaders();
    http.Response response = await http.get(Uri.parse(api),
        headers: hearders);
    var result = json.decode(response.body);
    return result;
  }




  Map<String, String> _getHeaders() {
    Map<String,String> hearders = new Map();
    hearders["Content-Type"] = "application/x-www-form-urlencoded";
    hearders["User-Agent"] = "sparrow";
    hearders["cookie"] = _cookie;
    return hearders;
  }

  void getNesHttpData() async{
    if(_cookie == null){
      _view.resultOfEvent(false,null,SparrowException.GET_COOKIES_FAIL);
    }
    var result = await _getHttpData(Api.news);
    ThirddataEntity thirddataEntity = new ThirddataEntity.fromJson(result);
    if(thirddataEntity==null){
      _view.resultOfNews(false,null,SparrowException.NETWORK_ERROR);
    }else if(thirddataEntity.data == null){
      _view.resultOfNews(false,null,SparrowException.NULL_DATA);
    }else{
      _view.resultOfNews(true,thirddataEntity,SparrowException.OK);
    }
  }

  void saveCookie() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("cookies", _cookie);
  }

  Future<Null> getAllCookies(FlutterWebviewPlugin flutterWebviewPlugin) async {
    final String result = await flutterWebviewPlugin.getAllCookies("https://www.yuque.com/dashboard");
    _cookie = result;
    saveCookie();
    _getToken();
    getEventHttpData();
    getHistoryHttpData();
    getNesHttpData();
  }

  void _getToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = preferences.getString("token");
    if(_token == null && !_isExpire){
      String postBody = '{"description":"微语雀","scope":"group:read,group,topic:'
          'read,topic,repo:read,repo,doc:read,doc,artboard","type":"oauth"}';
      Map<String,String> headers = _getHeaders();
      headers['x-csrf-token'] = _cookie.split("ctoken=")[1].split(";")[0];
      headers['content-type'] = "application/json";
      http.Response response = await http.post(Api.token,body: postBody,headers: headers);
      Map<String,dynamic> result = json.decode(response.body);
      TokenEntity tokenEntity = TokenEntity.fromJson(result);
      preferences.setString("token", tokenEntity.data.token);
    }

  }

  void setTokenIsExpire(bool param){
    this._isExpire = param;
  }



}