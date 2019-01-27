import 'package:flutter/material.dart';
import 'package:micro_sparrow/View/ISearchView.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';
import 'package:micro_sparrow/model/UserSearch_entity.dart';
import 'package:micro_sparrow/presenter/SearchPresenter.dart';

class SearchView extends StatefulWidget{
  SearchView({Key key, this.id}) : super(key: key);

  final String id;

  @override
  State<StatefulWidget> createState() {
    return new _SearchPage();
  }


}

class _SearchPage extends State<SearchView> implements ISearchView{

  TextEditingController _textEditingController = new TextEditingController();
  SearchPresenter _presenter = new SearchPresenter();
  bool content = false;
  bool isLoading = false;
  UsersearchEntity _usersearchEntity;

  @override
  void initState() {
    super.initState();
    _presenter.init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
        title: new TextField(
          controller: _textEditingController,
          decoration: new InputDecoration.collapsed(
              hintText: '用户',
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            setState(() {
              isLoading = true;
            });
            _presenter.searchUser(_textEditingController.text);
          })
        ],
      ),
      body: new Center(
        child: _getContent(),
      ),
    );
  }

  @override
  void resultOfSearch(bool param0, UsersearchEntity entity, String ok) {
    setState(() {
      isLoading = false;
    });
    if(param0){
      setState(() {
       if(entity.data.numhits==0){
         content = false;
       }else{
         content = true;
       }
        _usersearchEntity = entity;
      });
    }
  }

  Widget getItem(int position) {
    return new ListTile(
      leading: CircleAvatar(
        backgroundImage: Image.network(_usersearchEntity.data.hits[position].avatarUrl).image,
      ),
      title: Text(_usersearchEntity.data.hits[position].name.replaceAll('<em>', "").replaceAll('</em>', "")),
      subtitle: Text(_usersearchEntity.data.hits[position].login),
      trailing: new FlatButton(onPressed: (){
        _presenter.inviteUser(widget.id, _usersearchEntity.data.hits[position].login);
      },child: Text("邀请加入",style: TextStyle(color: Colors.blue),),),
    );
  }

  getLength() {
    if(_usersearchEntity.data == null){
      return 0;
    }else{
      return _usersearchEntity.data.numhits;
    }
  }

  _getContent() {
    if(!isLoading){
      if(content){
        return ListView.builder(itemBuilder: (BuildContext context,int position){
          return getItem(position);
        },itemCount: getLength(),);
      }else{
        return Text("这里什么都没有");
      }
    }else{
      return ColorLoader(radius: 15,dotRadius: 6,);
    }

  }

  @override
  void resultOfInvite(bool param0, param1, String ok) {
    // TODO: implement resultOfInvite
  }



}