import 'package:flutter/material.dart';
import 'package:micro_sparrow/View/BookView.dart';
import 'package:micro_sparrow/View/IUserView.dart';
import 'package:micro_sparrow/Widget/ColoredTabBar.dart';
import 'package:micro_sparrow/model/BooksAndColumn.dart';
import 'package:micro_sparrow/model/FollowUserResponse.dart';
import 'package:micro_sparrow/model/Follow_entity.dart';
import 'package:micro_sparrow/model/User_entity.dart';
import 'package:micro_sparrow/model/Vo/FollowVo.dart';
import 'package:micro_sparrow/presenter/UserPresenter.dart';

class UserView extends StatefulWidget{
  UserView({Key key, this.id}) : super(key: key);
  final String id;
  @override
  State<StatefulWidget> createState() {
    return new _UserView();
  }

}

class _UserView extends State<UserView> implements IUserView{

  UserPresenter _presenter = new UserPresenter();
  var _scaffoldkey = new GlobalKey<ScaffoldState>();
  BooksAndColumnEntity _booksAndColumnEntity;
  UserEntity _userEntity;
  FollowEntity _followEntity;
  FollowEntity _followersEntity;
  ScrollController _controller;
  bool show = false;
  Map<num, bool> _isFollowed = new Map();

  @override
  void initState() {
    super.initState();
    _presenter.init(this);
    _presenter.getUserData(widget.id);
    _presenter.getBooksData(widget.id, 0, 20);
    _presenter.getFollowUser(widget.id, "0");
    _presenter.getFollowersUser(widget.id, "0");
    _controller = new ScrollController();
    _controller.addListener((){
      if(_controller.offset > 150){
        setState(() {
          show = true;
        });
      }else{
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
        child:Scaffold(
          key: _scaffoldkey,
          appBar: null,
          body: NestedScrollView(controller: _controller,
              headerSliverBuilder: (BuildContext context,bool innerBoxIsScroller){
            return <Widget>[
              SliverOverlapAbsorber(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  elevation: 0,
                  floating: false,
                  pinned: true,
                  title: show && _userEntity!=null ? new Text(_userEntity.data.name): null,
                  expandedHeight: 280,
                  forceElevated: innerBoxIsScroller,
                  flexibleSpace:  FlexibleSpaceBar(
                    background: new Container(
                      color: Colors.white,
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            width: double.infinity,
                            height: 128,
                            child: new Image(image: ExactAssetImage("res/backgroup.jpg"),fit: BoxFit.fitWidth,alignment: Alignment.topCenter,),
                          ),
                          new Container(
                              margin: EdgeInsets.only(left: 16,top: 88),
                              child: new Container(
                                width: 80,
                                height: 80,
                                child: CircleAvatar(
                                  backgroundImage: FadeInImage.assetNetwork(placeholder: "1", image: _userEntity == null ? "https://gw.alipayobjects.com/zos/rmsportal/wYnHWSXDmBhiEmuwXsym.png?x-oss-process=image/resize,m_fill,w_192,h_192/format,png":_userEntity.data.mediumAvatarUrl).image,
                                ),
                              )
                          ),
                          new Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 136,right: 18),
                            child: OutlineButton(onPressed: (){
                              if(_isFollowed[int.parse(widget.id)]!=null){
                                if(_isFollowed[int.parse(widget.id)]){
                                  _presenter.deleteFollowUser(int.parse(widget.id));
                                }else{
                                  _presenter.followUser(int.parse(widget.id));
                                }
                              }
                            },highlightedBorderColor: Colors.green,
                              borderSide: BorderSide(color: Colors.green),
                              disabledBorderColor: Colors.grey,
                              child: _isFollowed[int.parse(widget.id)]==null || _isFollowed[int.parse(widget.id)] ? new Text("取消关注",style: TextStyle(color: Colors.green),):new Text("关注",style: TextStyle(color: Colors.green),),),
                          ),
                          new Container(
                            margin: EdgeInsets.only(top: 176,left: 16),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(_userEntity == null? "":_userEntity.data.name ,style: TextStyle(fontSize: 16),),
                                new Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: RichText(text: new TextSpan(
                                      text: "关注了  ",
                                      style: TextStyle(color: Colors.grey,fontSize: 12),
                                      children: <TextSpan>[
                                        new TextSpan(
                                            text: _userEntity == null? "": _userEntity.data.followingCount.toString(),
                                            style: TextStyle(color: Colors.black,fontSize: 12)
                                        ),
                                        new TextSpan(
                                            text: "    关注者 ",
                                            style: TextStyle(fontSize: 12)
                                        ),
                                        new TextSpan(
                                            text: _userEntity == null ?"":_userEntity.data.followersCount.toString(),
                                            style: TextStyle(color: Colors.black,fontSize: 12)
                                        ),
                                      ]
                                  )),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(top: 8,bottom: 8),
                                  child: new Text(_userEntity == null || _userEntity.data.description == null? "暂时没有描述":_userEntity.data.description,style: TextStyle(color: Colors.grey,)),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.only(bottom: 38),
                            alignment: Alignment.bottomCenter,
                            child: new Divider(),
                          ),
                        ],
                      ),
                    )
                  ),
                  bottom: ColoredTabBar(Colors.white,TabBar(labelColor: Colors.green,
                      indicatorColor: Colors.lightGreen,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor:Colors.black54 ,
                      tabs: <Widget>[
                        Tab(
                          text: "知识库",
                        ),
                        Tab(
                          text: "关注了",
                        ),
                        Tab(
                          text: "关注者",
                        ),
                        Tab(
                          text: "团队",
                        ),
                      ]),),
                ),
              )
            ];
          }, body: TabBarView(children: <Widget>[
            _getBookContent(),
            _getFollowUsersContent(),
            _getFollowerUsersContent(),
            _getFollowUsersContent(),
          ])),
        )
    );
  }

  _getFollowUsersContent() {
    return Builder(builder: (BuildContext context){
      return CustomScrollView(
        slivers: <Widget>[
          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext contetx,int position){
                  return new Column(
                    children: <Widget>[
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                            return UserView(id: _followEntity.data[position].id.toString(),);
                          }));
                        },
                        leading: CircleAvatar(
                          backgroundImage: FadeInImage.assetNetwork(placeholder: "img", image: _followEntity.data[position].smallAvatarUrl).image,
                        ),
                        subtitle: _followEntity.data[position].description == null ? null : new Text(_followEntity.data[position].description),
                        title: Text(_followEntity.data[position].name),
                        trailing: FlatButton(splashColor: Colors.greenAccent,onPressed: (){}, child: _isFollowed[int.parse(widget.id)]==null || _isFollowed[int.parse(widget.id)] == false ? new Text("取消关注",style: TextStyle(color: Colors.blue),):new Text("关注",style: TextStyle(color: Colors.blue),)),
                      ),
                      new Divider(height: 1,indent: 16,)
                    ],
                  );
                },childCount: _getFollowUsersCount()),),
          )
        ],
      );
    });
  }


  _getFollowerUsersContent() {
    return Builder(builder: (BuildContext context){
      return CustomScrollView(
        slivers: <Widget>[
          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext contetx,int position){
                return new Column(
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                          return UserView(id: _followersEntity.data[position].id.toString(),);
                        }));
                      },
                      leading: CircleAvatar(
                        backgroundImage: FadeInImage.assetNetwork(placeholder: "img", image: _followersEntity.data[position].smallAvatarUrl).image,
                      ),
                      subtitle: _followersEntity.data[position].description == null ? null : new Text(_followersEntity.data[position].description),
                      title: Text(_followersEntity.data[position].name),
                      trailing: FlatButton(splashColor: Colors.greenAccent,onPressed: (){}, child: _isFollowed[_followersEntity.data[position].id] ? new Text("取消关注",style: TextStyle(color: Colors.blue),):new Text("关注",style: TextStyle(color: Colors.blue),)),
                    ),
                    new Divider(height: 1,indent: 16,)
                  ],
                );
              },childCount: _getFollowerUsersCount()),),
          )
        ],
      );
    });
  }

  _getBookContent() {
    return Builder(builder: (BuildContext context){
      return CustomScrollView(
        slivers: <Widget>[
          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext contetx,int position){
                return new Column(
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                          return BookView(id: _booksAndColumnEntity.data[position].id.toString(),);
                        }));
                      },
                      leading: Icon(Icons.description,color: Colors.blue,),
                      subtitle: _booksAndColumnEntity.data[position].description == null ? null : new Text(_booksAndColumnEntity.data[position].description),
                      title: Text(_booksAndColumnEntity.data[position].name),
                    ),
                    new Divider(height: 1,),
                  ],
                );
              },childCount: _getBoosCount()),),
          )
        ],
      );
    });
  }

  @override
  void resultOfUserData(bool param0, UserEntity entity, String s) {
    if(param0){
      _presenter.isFollowedUser(entity.data.id.toString());
      setState(() {
        this._userEntity = entity;
      });
    }else{
      _scaffoldkey.currentState.showSnackBar(SnackBar(content: new Text(s)));
    }
  }

  @override
  void resultOfBoosAndColumn(bool param0, BooksAndColumnEntity booksAndColumnEntity, String s) {
    if(param0){
      setState(() {
        this._booksAndColumnEntity = booksAndColumnEntity;
      });
    }else{
      _scaffoldkey.currentState.showSnackBar(SnackBar(content: new Text(s)));
    }
  }

  _getBoosCount() {
    if(_booksAndColumnEntity == null || _booksAndColumnEntity.data == null){
      return 0;
    }else{
      return _booksAndColumnEntity.data.length;
    }
  }

  @override
  void resultOfFollowUser(bool param0, FollowEntity followEntity, String s) {
    if(param0){
      setState(() {
        this._followEntity = followEntity;
      });
    }else{
      _scaffoldkey.currentState.showSnackBar(SnackBar(content: new Text(s)));
    }
  }

  _getFollowUsersCount() {
    if(_followEntity == null || _followEntity.data == null){
      return 0;
    }else{
      return _followEntity.data.length;
    }
  }

  @override
  void resultOfFollowersUser(bool param0, FollowEntity followEntity, String s) {
    if(param0){
      _presenter.isFollowedUsers(followEntity);
      setState(() {
        this._followersEntity = followEntity;
      });
    }else{
      _scaffoldkey.currentState.showSnackBar(SnackBar(content: new Text(s)));
    }
  }

  _getFollowerUsersCount() {
    if(_followersEntity == null || _followersEntity.data == null){
      return 0;
    }else{
      return _followersEntity.data.length;
    }
  }

  @override
  void checkIsFollowed(bool param0, Map<num, bool> isFollowed, String s) {
    if(param0){
      setState(() {
        this._isFollowed.addAll(isFollowed);
      });
    }
  }

  @override
  void followUser(bool param0, FollowUserResponse response, String s) {
    if(param0){
      setState(() {
        this._isFollowed[int.parse(widget.id)] = true;
      });
    }
  }

  @override
  void deleteFollowUser(bool param0, FollowVo followVo, String s) {
    if(param0){
      setState(() {
        this._isFollowed[int.parse(widget.id)] = false;
      });
    }
  }
}