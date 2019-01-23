import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:micro_sparrow/View/BookView.dart';
import 'package:micro_sparrow/View/IGroupView.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';
import 'package:micro_sparrow/presenter/GroupPresenter.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:micro_sparrow/model/Group_entity.dart';


class GroupView extends StatefulWidget{

  GroupView({Key key, this.id,this.imageUrl,this.title,this.subscripe,this.peopleNum}) : super(key: key);

  final String id;
  final String imageUrl;
  final String title;
  final String subscripe;
  final String peopleNum;

  @override
  State<StatefulWidget> createState() {
    return new _groupPage();
  }

}

class _groupPage extends State<GroupView> implements IGroupView{


  GroupEntity _groupEntity = new GroupEntity();

  GroupPresenter _groupPrenster = new GroupPresenter();

  bool isLoading = true;



  @override
  void initState() {
    super.initState();
    _groupPrenster.init(this);
    _groupPrenster.getGroupHttpData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            brightness: Brightness.light,
            centerTitle: true,
            expandedHeight: 200,
            flexibleSpace: _getBar(),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add,color: Colors.white,),
                onPressed: (){
                },
              )
            ],
          ),
          Builder(builder: (BuildContext context){
            return isLoading ? SliverFillRemaining(child: new Center(child: ColorLoader(radius: 15,dotRadius: 6,),),):
            SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,int position){
              return _getContentItem(position);
            },childCount: _getLength()));
          })
        ],
      ),
    );
  }

  _getBar() {
    return Container(
      margin: EdgeInsets.all(0),
      child: new FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(0),
                  child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: widget.imageUrl,fit: BoxFit.cover,)
                ),
                BackdropFilter(filter: new ImageFilter.blur(sigmaX: 30,sigmaY: 30),
                  child:new Container(
                    margin: EdgeInsets.all(0),
                    color: Colors.green.withOpacity(0),
                  ),),
              ],
            ),
            new Center(
              child: new Padding(padding: EdgeInsets.only(left: 16,top: 82,right: 16,bottom: 16),
              child:new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: 80,
                    height: 80,
                    child: Hero(tag: widget.id, child: CircleAvatar(
                      backgroundImage: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: widget.imageUrl,fit: BoxFit.cover,).image,
                    ),)
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 0,left: 16),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.title,style: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Padding(padding: EdgeInsets.only(top: 16),
                        child: Text(widget.subscripe),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 16,right: 12),
                    child: new Icon(Icons.people),
                  ),
                  new Text(widget.peopleNum +"人")
                ],
              ),
              )
            )
          ],
        )
      )
    );

  }


  @override
  void getGroupHttpResult(param0, bool param1) {
    isLoading = false;
    if(param1){
      setState(() {
        _groupEntity = GroupEntity.fromJson(param0);
        if(_groupEntity.data.length == 0){
          print("group is null ");
        }else{
          print("get group data successfully");
        }
      });
    }
  }

  _getLength() {
    if(_groupEntity.data == null){
      return 0;
    }else{
      return _groupEntity.data.length;
    }
  }

  Widget _getContentItem(int position) {
    return new Card(
      elevation: 0,
      margin: EdgeInsets.only(left: 0,right: 0,top: 8,bottom: 8),
      child: new Column(
        children: <Widget>[
          new InkWell(
            child: new ListTile(
              leading: Icon(Icons.book,color: Colors.blue,size: 20,),
              title: new Text(_groupEntity.data[position].name,style: new TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.chevron_right,color:Colors.grey,),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return new BookView(id: _groupEntity.data[position].id.toString(),title: _groupEntity.data[position].name,);
              }));
            },
          ),
          _getIfDiver(position),
          Builder(builder: (BuildContext context){
            return MediaQuery.removePadding(context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView.builder(itemBuilder: (BuildContext context,int mposition){
                  return _getSummaryItem(position,mposition);
                },itemCount: _getSummaryCount(position),shrinkWrap: true,physics: ClampingScrollPhysics(),)
            );
          })
        ],
      ),
    );
  }

  Widget _getSummaryItem(int position,int mPosition) {
    return new InkWell(
      child: new Container(
        margin: EdgeInsets.only(left: 20,top: 8,right: 8,bottom: 8),
        child: new Text(_groupEntity.data[position].summary[mPosition].title,overflow: TextOverflow.ellipsis,),
      ),
      onTap: (){},
    );
  }

  _getSummaryCount(int position) {
    if(_groupEntity.data[position].summary == null){
      return 0;
    }else{
      return _groupEntity.data[position].summary.length;
    }
  }

  _getIfDiver(int position) {
    if(_groupEntity.data[position].summary == null || _groupEntity.data[position].summary.length == 0){
      //todo 优化
      return Center();
    }else{
      return new Divider(height: 1);
    }
  }

}



