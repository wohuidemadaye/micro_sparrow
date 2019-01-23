import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';
import 'package:micro_sparrow/Widget/MyExpansionTitle.dart' as mExpansion;
import 'package:micro_sparrow/View/IBookView.dart';
import 'package:micro_sparrow/Widget/ReadArticle.dart';
import 'package:micro_sparrow/model/TocTree.dart';
import 'package:micro_sparrow/presenter/BookPresenter.dart';
import 'package:micro_sparrow/model/Book_entity.dart';

class BookView extends StatefulWidget{
  BookView({Key key, this.id,this.title,}) : super(key: key);

  final String id;
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new _BookPage();
  }

}

class _BookPage extends State<BookView> implements IBookView {

  BookPresenter _bookPresenter = new BookPresenter();
  List<TocTree> _bookList;
  String _url = "";
  bool loading = true;


  @override
  void initState() {
    super.initState();
    _bookPresenter.init(this);
    _bookPresenter.getTopic(widget.id);
  }


  @override
  Widget build(BuildContext context) {
    _webViewLogin();
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(widget.title),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.refresh), onPressed: (){})
        ],
      ),
      body: new Center(
        child: loading ? ColorLoader(
          radius: 15,
          dotRadius: 6,
        ):ListView.builder(itemBuilder: (BuildContext context,int position){
          return _getItem(position);
        },itemCount: _getLength(),),
      )
    );
  }

  @override
  void resultOfBook(bool param0,content,String message) {
    _url = message;
    if(param0){
      setState(() {
        _bookList = content;
        loading = false;
      });
    }else{
      print(message);
    }
  }


  Widget _getItem(int position) {
    if(_bookList[position].childCount == 0){
      return mExpansion.ExpansionTile(
        title:new Text(_bookList[position].title),
        children: _getWidgets(position),
        trailing: new Container(width: 0,height: 0,),
        leading: _ifCanLook(position),
        titleOnTap: (){
          if(_bookList[position].style == "DOC"){
            String url = "https://www.yuque.com/"+ _url + "/" +_bookList[position].url;
            String title = _bookList[position].title;
            _readArticle(url, title);
          }
        },
      );
    }else{
      return mExpansion.ExpansionTile(
        title:new Text(_bookList[position].title),
        children: _getWidgets(position),
        initiallyExpanded: true,
        leading: _ifCanLook(position),
        titleOnTap: (){
          if(_bookList[position].style == "DOC"){
            String url = "https://www.yuque.com/"+ _url + "/" +_bookList[position].url;
            String title = _bookList[position].title;
            _readArticle(url, title);
          }
        },
      );
    }
  }

  _getLength() {
    if(_bookList == null){
      return 0;
    }else{
      return _bookList.length;
    }
  }

  _getWidgets(int position) {
    List<Widget> w = new List();
    for(int i = 0;i<_bookList[position].childCount;i++){
      w.add(
        new ListTile(
          onTap: (){
            if(_bookList[position].child[i].style == "DOC"){
              String url = "https://www.yuque.com/"+ _url + "/" +_bookList[position].child[i].url;
              String title = _bookList[position].title;
              _readArticle(url, title);
            }
          },
          leading: new Container(
            margin: EdgeInsets.only(left: 8),
            child: Icon(Icons.brightness_1,color: Colors.green,size: 15,),
          ),
          title: new Text(_bookList[position].child[i].title,style: TextStyle(fontSize: 14),),
        ),
      );
    }
    return w;
  }

  _readArticle(String uri,String title) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (BuildContext context) {
      return ReadArticle(url: uri,);
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

  _ifCanLook(int position) {
    if(_bookList[position].style == "DOC"){
      return Icon(Icons.insert_drive_file,color: Colors.blue,size: 16,);
    }else{
      return Icon(Icons.insert_drive_file,size: 16,);
    }
  }
}