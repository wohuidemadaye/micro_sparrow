import 'package:flutter/material.dart';
import 'package:micro_sparrow/View/BookView.dart';
import 'package:micro_sparrow/View/GroupView.dart';
import 'package:micro_sparrow/View/IAllBookView.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';
import 'package:micro_sparrow/model/AllBook_entity.dart';
import 'package:micro_sparrow/presenter/AllBookPresenter.dart';

class AllBookView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AllBookView();
  }

}

class _AllBookView extends State<AllBookView> implements IAllBookView{

  AllBookPresenter _presenter = new AllBookPresenter();
  AllbookEntity _allBookEntity;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _presenter.init(this);
    _presenter.getHttpData();
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: new Text("知识库"),
          floating: false,
          pinned: true,
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

  Widget getItem(int position) {
    return new Column(
      children: <Widget>[
        ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return new BookView(
                id: _allBookEntity.data[position].id.toString(),
                title: _allBookEntity.data[position].name,
              );
            }));
          },
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: new Container(
              child: Icon(Icons.collections_bookmark,color: Colors.white,),
            ),
          ),
          title: new Text(_allBookEntity.data[position].name),
          subtitle: new Text(_allBookEntity.data[position].itemsCount.toString()+ "篇文章 · " + _allBookEntity.data[position].watchesCount.toString() + "关注"),
        ),
        new Divider(height: 1,)
      ],
    );
  }

  getLength() {
    if(_allBookEntity==null || _allBookEntity.data == null){
      return 0;
    }else{
      return _allBookEntity.data.length;
    }
  }

  @override
  void getBookHttpResult(body, bool param1, String s) {
    isLoading = false;
    if(param1){
      setState(() {
        _allBookEntity = AllbookEntity.fromJson(body);
      });
    }
  }

}