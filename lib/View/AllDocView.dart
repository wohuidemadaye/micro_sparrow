import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:micro_sparrow/View/IAllDocView.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';
import 'package:micro_sparrow/model/AllDoc_entity.dart';
import 'package:micro_sparrow/presenter/AllDocPresenter.dart';

class AllDocView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _AllDocPage ();
  }

}

class _AllDocPage extends State<AllDocView> implements IAllDocView {

  AllDocPresenter _presenter = new AllDocPresenter();
  AlldocEntity _alldocEntity;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _presenter.init(this);
    _presenter.getHttpData();
  }

  @override
  Widget build(BuildContext context) {
    _webViewLogin();
    return new CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: new Text("文档"),
          floating: false,
          pinned: true,
          centerTitle: true,
        ),
        Builder(builder: (BuildContext context){
          return isLoading ? SliverFillRemaining(child: new Center(child: ColorLoader(radius: 15,dotRadius: 6,),),):
          SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,int position){
            return getItem(position);
          },childCount: getLength()));
        })
      ],
    );
  }

  @override
  void getDocHttpResult(body, bool param1, String s) {
    isLoading = false;
    if(param1){
      setState(() {
        _alldocEntity = AlldocEntity.fromJson(body);
      });
    }else{
      print(s);
    }
  }

  Widget getItem(int position) {
    return ListTile(
      onTap:(){
        String url ="https://www.yuque.com/" +
            _alldocEntity.data[position].book.user.login + "/"
            + _alldocEntity.data[position].book.slug + "/" + _alldocEntity.data[position].slug;
        String title = _alldocEntity.data[position].title;
        _readArticle(url, title);
      },
      title: new Text(_alldocEntity.data[position].title),
      leading: ifPublish(position),
      subtitle: new Text(_alldocEntity.data[position].book.user.name + "/" + _alldocEntity.data[position].book.name),
    );
  }

  getLength() {
    if(_alldocEntity == null || _alldocEntity.data == null){
      return 0;
    }else{
      return _alldocEntity.data.length;
    }
  }

  ifPublish(int position) {
    if(_alldocEntity.data[position].status == 1){
      return Icon(Icons.class_,color: Colors.blue,);
    }else{
      return Icon(Icons.class_,);
    }
  }

  _readArticle(String uri,String title) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (BuildContext context) {
      return WebviewScaffold(url: uri,
        withLocalStorage: true,
        enableAppScheme: true,
        withZoom: false,
        withJavascript: true,
        allowFileURLs: true,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.more_vert, color: Colors.black45,),
              onPressed: () {},
            )
          ],
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black45,),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        appCacheEnabled: true,);
    }));
  }

  void _webViewLogin() {
    FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();
    flutterWebviewPlugin.hide();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged type) {
      if (type.type == WebViewState.finishLoad) {
        flutterWebviewPlugin.evalJavascript(
            'document.querySelector("#ReactApp > div > div > div.m-content > div.m-header-back").style.display="none";')
            .then((String result) {
          flutterWebviewPlugin.show();
        });
      }
    });
  }
}