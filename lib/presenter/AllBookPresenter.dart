import 'dart:convert';

import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/Utils/SparrowException.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/IAllBookView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class AllBookPresenter implements IPresenter{

  IAllBookView _view;

  @override
  init(IView view) {
    this._view = view;
  }

  void getHttpData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cookies = preferences.getString("cookies");
    if(cookies == null){
      _view.getBookHttpResult(null,false,SparrowException.GET_COOKIES_FAIL);
      return;
    }
    Map<String,String> hearders = new Map();
    hearders["Content-Type"] = "application/x-www-form-urlencoded";
    hearders["User-Agent"] = "sparrow";
    hearders["cookie"] = cookies;
    http.Response response = await http.get(Uri.parse(Api.bookApi),
        headers: hearders);
    var body = json.decode(response.body);
    _view.getBookHttpResult(body,true,"获取知识库数据成功");

  }

}