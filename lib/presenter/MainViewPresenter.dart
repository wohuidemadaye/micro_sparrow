import 'dart:convert';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/Utils/SparrowException.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/IMainView.dart';
import 'package:micro_sparrow/model/Doc_entity.dart';
import 'package:micro_sparrow/model/EventEntity.dart';
import 'package:micro_sparrow/model/ExistToken_entity.dart';
import 'package:micro_sparrow/model/Notification_entity.dart';
import 'package:micro_sparrow/model/ThirdData_entity.dart';
import 'package:micro_sparrow/model/Token_entity.dart';
import 'package:micro_sparrow/model/UserInfo_entity.dart';
import 'package:micro_sparrow/presenter/AbsPresenter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MainViewPresenter extends AbsPresenter implements  IPresenter{

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

  Future<Null> getHistoryHttpData() async{
    if(_cookie == null){
      _view.resultOfEvent(false,null,SparrowException.GET_COOKIES_FAIL);
      return;
    }
    var result = await _getHttpData(Api.historyDoc(0, 15));
    DocEntity docEntity = new DocEntity.fromJson(result);
    if(docEntity==null){
      _view.resultOfHistoryDoc(false,null,SparrowException.NETWORK_ERROR);
    }else if(docEntity.data == null){
      _view.resultOfHistoryDoc(false,null,SparrowException.NULL_DATA);
    }else{
      _view.resultOfHistoryDoc(true,docEntity,SparrowException.OK);
    }
    return;
  }

  Future<Null> getEventHttpData() async{
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
    print(result);
    EventEntity _event = new EventEntity.fromJson(result);
    if(_event==null){
      _view.resultOfEvent(false,null,SparrowException.NETWORK_ERROR);
    }else if(_event.data == null){
      _view.resultOfEvent(false,null,SparrowException.NULL_DATA);
    }else{
      _view.resultOfEvent(true,_event,SparrowException.OK);
    }
    return;
  }


  Future<Map<String,dynamic>> _getHttpData(String api) async{
    Map<String,String> hearders;
    hearders = _getHeaders();
    http.Response response = await http.get(Uri.parse(api),
        headers: hearders);
    var result = json.decode(response.body);
    return result;
  }


  ///
  /// 添加请求头
  ///
  Map<String, String> _getHeaders() {
    Map<String,String> hearders = new Map();
    hearders["Content-Type"] = "application/x-www-form-urlencoded";
    hearders["User-Agent"] = "sparrow";
    hearders["cookie"] = _cookie;
    return hearders;
  }

  Future<Null> getNesHttpData() async{
    if(_cookie == null){
      _view.resultOfEvent(false,null,SparrowException.GET_COOKIES_FAIL);
    }
    var result = await _getHttpData(Api.news(0));
    ThirddataEntity thirddataEntity = new ThirddataEntity.fromJson(result);
    if(thirddataEntity==null){
      _view.resultOfNews(false,null,SparrowException.NETWORK_ERROR);
    }else if(thirddataEntity.data == null){
      _view.resultOfNews(false,null,SparrowException.NULL_DATA);
    }else{
      _view.resultOfNews(true,thirddataEntity,SparrowException.OK);
    }
    return;
  }

  void saveCookie() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("cookies", _cookie);
  }

  Future<Null> getAllCookies(FlutterWebviewPlugin flutterWebviewPlugin) async {
    final String result = await flutterWebviewPlugin.getAllCookies("https://www.yuque.com/dashboard");
    _cookie = result;
    saveCookie();
    await _getToken();
    getEventHttpData();
    getMyInfo();
    getHistoryHttpData();
    getNesHttpData();
    getNotification();
  }

  ///
  /// 获取语雀的token
  /// 
  Future<Null> _getToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = preferences.getString("token");
    if(_token == null  || _isExpire){
      Map<String,dynamic> result =await _getHttpData(Api.getToken);
      ExisttokenEntity existTokenEntity = ExisttokenEntity.fromJson(result);
      if(existTokenEntity == null || existTokenEntity.data.length == 0){
        _createToken();
        return;
      }
      //获取语雀中已经存在的token值防止重复创建
      for(int i = 0;i<existTokenEntity.data.length;i++){
        if(existTokenEntity.data[i].description == "微语雀"){
          Map<String,dynamic> result = await _getHttpData(Api.getTokenInfo(existTokenEntity.data[i].id.toString()));
          TokenEntity exist = TokenEntity.fromJson(result);
          _token = exist.data.token;
          preferences.setString("token", exist.data.token);
          return;
        }
      }
      await _createToken();
      return;
    }

  }

  ///
  /// 设置token是否有效，当用户自行删除token时，可以通过修改isExpire参数重新获取token
  ///
  void setTokenIsExpire(bool param){
    this._isExpire = param;
  }


  ///
  /// 创建token
  ///
  Future<Null> _createToken() async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String postBody = '{"description":"微语雀","scope":"group:read,group,'
          'topic:read,topic,repo:read,repo,doc:read,doc,artboard","type":"oauth"}';
      Map<String,String> headers = _getHeaders();
      headers['x-csrf-token'] = _cookie.split("ctoken=")[1].split(";")[0];
      headers['content-type'] = "application/json";
      http.Response response = await http.post(Api.token,body: postBody,headers: headers);
      Map<String,dynamic> result = json.decode(response.body);
      TokenEntity tokenEntity = TokenEntity.fromJson(result);
      preferences.setString("token", tokenEntity.data.token);
  }

  void getMoreDocData(int length) async{
    if(_cookie == null){
      _view.resultOfEvent(false,null,SparrowException.GET_COOKIES_FAIL);
      return;
    }
    var result = await _getHttpData(Api.historyDoc(length, 10));
    DocEntity entity = new DocEntity.fromJson(result);
    if(entity==null){
      _view.resultOfMoreDoc(false,null,SparrowException.NETWORK_ERROR);
    }else if(entity.data == null){
      _view.resultOfMoreDoc(false,null,SparrowException.NULL_DATA);
    }else{
      _view.resultOfMoreDoc(true,entity,SparrowException.OK);
    }
  }

  void getMoreNewsData(int length) async{
    if(_cookie == null){
      _view.resultOfEvent(false,null,SparrowException.GET_COOKIES_FAIL);
      return;
    }
    var result = await _getHttpData(Api.news(length));
    ThirddataEntity entity = new ThirddataEntity.fromJson(result);
    if(entity==null){
      _view.resultOfMoreNews(false,null,SparrowException.NETWORK_ERROR);
    }else if(entity.data == null){
      _view.resultOfMoreNews(false,null,SparrowException.NULL_DATA);
    }else{
      _view.resultOfMoreNews(true,entity,SparrowException.OK);
    }
  }

  void getMyInfo() async{
    var result = await getTokenHttpData(Api.getMyInfo());
    UserinfoEntity entity = UserinfoEntity.fromJson(result);
    if(entity == null || entity.data == null){
      _view.resultOfMyInfo(false,null,SparrowException.NETWORK_ERROR);
      return;
    }
    _view.resultOfMyInfo(true,entity,SparrowException.OK);
  }

  void clearAll() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = null;
    _cookie = null;
    preferences.setString("token", null);
    preferences.setString("cookies", null);
    _view.resultOfLogout();
  }

  void getUnReadNotifications(){

  }

  void getNotification() async{
    var result = await getCookieHttpData("https://www.yuque.com/api/notifications?offset=0&type=unread");
    NotificationEntity entity =  NotificationEntity.fromJson(result);
    if(entity == null || entity.data == null || entity.data.normalcount == 0){
      _view.resultOfNotification(false,null,SparrowException.NETWORK_ERROR);
      return;
    }
    _view.resultOfNotification(true,entity,SparrowException.OK);
  }



}