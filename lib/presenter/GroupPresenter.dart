import 'dart:convert';

import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/IGroupView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class GroupPresenter implements IPresenter{

  IGroupView view;

  @override
  init(IView view) {
    this.view = view;
  }

  void getGroupHttpData(String id) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cookies = preferences.getString("cookies");
    if(cookies == null){
      view.getGroupHttpResult(null,false);
      return;
    }
    Map<String,String> hearders = new Map();
    hearders["Content-Type"] = "application/x-www-form-urlencoded";
    hearders["User-Agent"] = "sparrow";
    hearders["cookie"] = cookies;
    http.Response response = await http.get(Uri.parse(Api.book(id)),
        headers: hearders);
    var body = json.decode(response.body);
    view.getGroupHttpResult(body,true);
  }



}