import 'dart:convert';

import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/View/ITeamView.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class TeamPresenter implements IPresenter{

  ITeamView view;

  @override
  init(IView view) {
    this.view = view;
    return null;
  }

  void getTeamHttpData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cookies = preferences.getString("cookies");
    if(cookies == null){
      view.getTeamHttpResult(null,false);
      return;
    }
    Map<String,String> hearders = new Map();
    hearders["Content-Type"] = "application/x-www-form-urlencoded";
    hearders["User-Agent"] = "sparrow";
    hearders["cookie"] = cookies;
    http.Response response = await http.get(Uri.parse(Api.team),
        headers: hearders);
    var body = json.decode(response.body);
    view.getTeamHttpResult(body,true);
  }




}