import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:micro_sparrow/Utils/SparrowException.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/IBookView.dart';
import 'package:http/http.dart' as http;
import 'package:micro_sparrow/model/Book_entity.dart';
import 'package:micro_sparrow/model/TocTree.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/model/Token_entity.dart';


class BookPresenter implements IPresenter{

  IBookView view;
  static const platform = const MethodChannel('samples.flutter.io/yami');
  List<TocTree> _list = new List();


  @override
  init(IView view) {
    this.view = view;
  }

  void getTopic(String id) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cookies = preferences.getString("cookies");
    if(cookies != null && cookies != ""){
      Map<String,String> hearders = new Map();
      hearders["cookie"] = cookies;
      http.Response response = await http.get(Uri.parse(Api.bookTopic(id)),headers: hearders);
      String content = response.body;
      if(content.split("decodeURIComponent").length >=1 && content.split("decodeURIComponent")[1].split('"').length >=1){
        String code = response.body.split("decodeURIComponent")[1].split('"')[1];
        final String result = await platform.invokeMethod('URLDecodedString',{'code': code});
        var body = json.decode(result);
        bodyToTree(body);
      }else{
        view.resultOfBook(false,null,SparrowException.GET_TOPIC_DATA_FAIL);
      }
    }else{
      view.resultOfBook(false, null,SparrowException.GET_COOKIES_FAIL);
    }


  }

  void bodyToTree(body) {
    BookEntity _bookEntity = BookEntity.fromJson(body);
    if(_bookEntity.book!=null){
      for(int i = 0;i<_bookEntity.book.toc.length;i++){
        TocTree tree = new TocTree();
        tree.title = _bookEntity.book.toc[i].title;
        tree.url = _bookEntity.book.toc[i].url;
        tree.childCount = 0;
        tree.style = _bookEntity.book.toc[i].type;
        if(_bookEntity.book.toc[i].level == 0){
          _list.add(tree);
        }else{
          _list[_list.length-1].child.add(tree);
          _list[_list.length-1].childCount ++ ;
        }
      }
      view.resultOfBook(true, _list,_bookEntity.search.scope);
    }
  }




}