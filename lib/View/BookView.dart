import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:micro_sparrow/View/EditView.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';
import 'package:micro_sparrow/Widget/MyExpansionTitle.dart' as mExpansion;
import 'package:micro_sparrow/View/IBookView.dart';
import 'package:micro_sparrow/Widget/ReadArticle.dart';
import 'package:micro_sparrow/model/AllDoc_entity.dart';
import 'package:micro_sparrow/model/DocDetailSerializer_entity.dart';
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
  AlldocEntity _allDocEntity;
  var _scaffoldkey = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    _bookPresenter.init(this);
    _bookPresenter.getTopic(widget.id);
    _bookPresenter.getAllDoc(widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(length: 2, initialIndex: 0,child: Scaffold(
      key: _scaffoldkey,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black87),
          flexibleSpace: SafeArea(
            child: getTabBar(),
          ),
          actions: <Widget>[
            IconButton(icon:Icon(Icons.add), onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return EditView(id: widget.id,);
              }));
            })
          ],
        ),
        body: TabBarView(children: <Widget>[
          new Center(
            child: loading ? ColorLoader(
              radius: 15,
              dotRadius: 6,
            ):ListView.builder(itemBuilder: (BuildContext context,int position){
              return _getItem(position);
            },itemCount: _getLength(),),
          ),
          new Center(
            child: ListView.builder(itemBuilder: (BuildContext context,int position){
              return _getAllItem(position);
            },itemCount: _getAllLength(),),
          ),
        ])
    ));
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
      setState(() {
        loading = false;
      });
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

  _ifCanLook(int position) {
    if(_bookList[position].style == "DOC"){
      return Icon(Icons.insert_drive_file,color: Colors.blue,size: 16,);
    }else{
      return Icon(Icons.insert_drive_file,size: 16,);
    }
  }

  Widget _getAllItem(int position) {
    return Column(
      children: <Widget>[
        ListTile(title: Text(_allDocEntity.data[position].title),
          onTap: (){
            String url = "https://www.yuque.com/"+ "go/doc/" + _allDocEntity.data[position].id.toString();
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return new ReadArticle(url: url,);
            }));
          },
          leading: Icon(Icons.brightness_1,color: Colors.green,size: 15,),
          trailing: PopupMenuButton<int>(itemBuilder: (BuildContext context)=>[
            new PopupMenuItem(
                value:0,
                child: Text("编辑",style: TextStyle(color: _allDocEntity.data[position].format == "markdown" ? Colors.black:Colors.grey),)
            ),
            new PopupMenuItem(
                value:1,
                child: Text("删除",style: TextStyle(color: Colors.red),)
            ),
            new PopupMenuItem(
                value:2,
                child: Text("移到目录")
            ),
          ],
            icon:Icon(Icons.more_vert,color: Colors.green,size: 20,),
            onSelected: (int value){
              if(value == 0 && _allDocEntity.data[position].format == "markdown"){
                _bookPresenter.readExistBook(_allDocEntity.data[position].slug,widget.id);
              } else if(value == 1){
                _bookPresenter.deleteDoc(position,widget.id,_allDocEntity.data[position].id.toString());
              }else{
                _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("暂未实现")));
              }
            },
          ),
        ),
        Divider(height: 1,)
      ],
    );
  }

  _getAllLength() {
    if(_allDocEntity==null || _allDocEntity.data == null){
      return 0;
    }else{
      return _allDocEntity.data.length;
    }
  }

  @override
  void resultOfAllDoc(bool param0, AlldocEntity entity, String ok) {
    if(param0){
      setState(() {
        _allDocEntity = entity;
      });
    }
  }

  getTabBar() {
    return new Center(
      child: TabBar(
          isScrollable: true,
          labelColor: Colors.green,
          indicatorColor: Colors.green,
          unselectedLabelColor: Colors.black87,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: <Widget>[
            Tab(text: "目录",),
            Tab(text: "文章",)
          ]),
    );
  }

  @override
  void resultOfDelDoc(bool param0, int position, String ok) {
    if(param0){
      _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("删除成功"),backgroundColor: Colors.green,));
      setState(() {
        _allDocEntity.data.removeAt(position);
      });
    }
  }

  @override
  void resultOfReadDoc(bool param0, DocdetailserializerEntity entity, String ok) {
    if(param0){
      Navigator.of(_scaffoldkey.currentState.context).push(MaterialPageRoute(builder: (BuildContext context){
        return new EditView(id: widget.id,entity: entity,);
      }));
    }
  }
}