import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/Utils/SparrowException.dart';
import 'package:micro_sparrow/View/AllBookView.dart';
import 'package:micro_sparrow/View/AllDocView.dart';
import 'package:micro_sparrow/View/BookView.dart';
import 'package:micro_sparrow/View/IMainView.dart';
import 'package:micro_sparrow/View/NotificationView.dart';
import 'package:micro_sparrow/View/TeamView.dart';
import 'package:micro_sparrow/View/UserView.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';
import 'package:micro_sparrow/Widget/ReadArticle.dart';
import 'package:micro_sparrow/model/EventEntity.dart';
import 'package:micro_sparrow/model/Doc_entity.dart';
import 'package:micro_sparrow/model/Notification_entity.dart';
import 'package:micro_sparrow/model/ThirdData_entity.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:micro_sparrow/model/UserInfo_entity.dart';
import 'package:micro_sparrow/presenter/MainViewPresenter.dart';





void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微语雀',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: '工作台'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin implements IMainView{
  EventEntity _event;
  DocEntity _doc;
  ThirddataEntity _thirddataEntity;
  int position = 0;
  TabController _tabController;
  bool firstTab2 = true;
  bool firstTab3 = true;
  bool firstLoading = true;
  bool secondLoading = true;
  bool thirdLoading = true;
  bool secondOver = false;
  bool thirdOver = false;
  bool loginFirst = true;
  BuildContext scaffoldContext;
  UserinfoEntity _userinfoEntity = new UserinfoEntity();
  MainViewPresenter _presenter = new MainViewPresenter();
  var _scaffoldkey = new GlobalKey<ScaffoldState>();
  NotificationEntity _notificationEntity;





  @override
  void initState() {
    super.initState();
    _presenter.init(this);
    _userinfoEntity.initData();
    _presenter.getEventHttpData();
    _presenter.getNotification();
    _presenter.getMyInfo();
    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener((){
      if(_tabController.index == 1 && firstTab2){
        _presenter.getHistoryHttpData();
        firstTab2 = false;
      }else if(_tabController.index == 2 && firstTab3){
        _presenter.getNesHttpData();
        firstTab3 = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    _webViewLogin();
    return Scaffold(
      key: _scaffoldkey,
        drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new UserAccountsDrawerHeader(accountName: Text(_userinfoEntity.data.name),
                accountEmail: Text(_userinfoEntity.data.description  == null? "":_userinfoEntity.data.description),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: Image.network(_userinfoEntity.data.avatarUrl).image,
                  ),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new ExactAssetImage("res/backgroup.jpg"),)
                ),),
              new ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  setState(() {
                    position = 0;
                  });
                },
                selected: position == 0,
                title: new Text("工作台"),
                leading: new Icon(Icons.apps),
              ),
              new ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  setState(() {
                    position = 1;
                  });
                },
                selected: position == 1,
                title: new Text("团队"),
                leading: new Icon(Icons.people_outline),
              ),
              new ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  setState(() {
                    position = 2;
                  });
                },
                selected: position == 2,
                title: new Text("知识库"),
                leading: new Icon(Icons.book),
              ),
              new Divider(),
              new ListTile(
                title: new Text("设置"),
                leading: new Icon(Icons.settings),
              ),
              new ListTile(
                title: new Text("关于"),
                leading: new Icon(Icons.web),
              ),
              _getLogOutView(),
            ],
          ),
        ),
        body: Builder(builder: (BuildContext context){
          this.scaffoldContext = context;
         return _getFromIndex(position);
        })
    );

  }

  _getListData(int position) {
        return new Card(
          shape: null,
          elevation: 0,
          child: new Padding(padding: new EdgeInsets.all(8.0),
              child: getContent(position)
          ),
        );
  }

  _getHistoryData(int position){
      if(position == _doc.data.length-1 && !secondOver){
        _presenter.getMoreDocData(_doc.data.length);
      }
      return new InkWell(
        onTap: (){
          String uri = "https://www.yuque.com/"+ _doc.data[position].book.user.login+ "/" + _doc.data[position].book.slug +  "/"+_doc.data[position].slug;
          String title = _doc.data[position].title;
          _readArticle(uri, title);
          },
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: ifPublish(position),
              title: new Text(_doc.data[position].title),
              subtitle: new Text(_doc.data[position].book.user.name + "/" + _doc.data[position].book.name),
            ),
            new Divider(height: 1,),
            position == _doc.data.length-1 && !secondOver ? new ColorLoader(radius: 15,dotRadius: 6,) : new Container(),
          ],
        )
      );
  }

  ifPublish(int position) {
    if(_doc.data[position].status == 1){
      return Icon(Icons.event_note,color: Colors.blue,);
    }else{
      return Icon(Icons.event_note,);
    }
  }


  _getLength() {
    if(_event == null){
      return 0;
    }else if(_event.data == null){
      return 0;
    }else{
      return _event.data.length;
    }
  }

  _getNesLength(){
    if(_thirddataEntity == null || _thirddataEntity.data == null){
      return 0;
    }else{
      return _thirddataEntity.data.length;
    }
  }

  String _getTimeFormat(String updatedAt) {
    String s = updatedAt.split(".")[0].replaceAll("T", " ");
    return s;
  }


  void _webViewLogin() {
    FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();
    if(_event != null){
      flutterWebviewPlugin.hide();
    }
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged type){
      if(type.type == WebViewState.finishLoad) {
        flutterWebviewPlugin.evalJavascript('document.querySelector("#ReactApp > div > div > div.m-content > div.m-header-back").style.display="none";').then((String result){
            flutterWebviewPlugin.show();
        });
      }
    });
    flutterWebviewPlugin.onUrlChanged.listen((String url){
      var _uri = Uri.parse(url);
      if(_uri.path == "/dashboard" && loginFirst){
        loginFirst = false;
        _presenter.getAllCookies(flutterWebviewPlugin);
        Navigator.of(context).pop();
        print("登陆成功");
      }
    });
  }



  Future<Null> _onEventRefresh() async {
    await _presenter.getEventHttpData();
    Scaffold.of(scaffoldContext).showSnackBar(
        new SnackBar(content: new Text("更新数据成功",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,)
    );
  }

  Future<Null> _onDocRefresh() async {
    await _presenter.getHistoryHttpData();
    Scaffold.of(scaffoldContext).showSnackBar(
        new SnackBar(content: new Text("更新数据成功",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,)
    );
  }

  Future<Null> _onNewsRefresh() async {
    await _presenter.getNesHttpData();
    Scaffold.of(scaffoldContext).showSnackBar(
        new SnackBar(content: new Text("更新数据成功",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,)
    );
  }


  _readArticle(String uri,String title) {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return ReadArticle(url: uri);})
    );

  }

  _getDocLength() {
    if( _doc==null){
      return 0;
    }else if(_doc.data == null){
      return 0;
    }
    return _doc.data.length;
  }

  _getNewsListItem(int position) {
    if(position == _thirddataEntity.data.length-1 && !thirdOver){
      _presenter.getMoreNewsData(_thirddataEntity.data.length);
    }
    return new Container(
      child: new Card(
        elevation: 0,
          child: new InkWell(
              onTap: (){
                String uri = "https://www.yuque.com/"+ _thirddataEntity.data[position].target.book.user.login + "/" + _thirddataEntity.data[position].target.book.slug +  "/"+_thirddataEntity.data[position].target.slug;
                String title = _thirddataEntity.data[position].title;
                _readArticle(uri, title);
              },
              child:new Padding(padding: const EdgeInsets.all(8),
              child: new Column(
                children: <Widget>[
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(margin: EdgeInsets.only(bottom: 8),
                            child: new Text(_thirddataEntity.data[position].title,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
                          new Text(_thirddataEntity.data[position].description,),
                        ],
                      )),
                      _getPhoto(position),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Container(width: 20,height: 20,
                        margin: EdgeInsets.only(top: 8,right: 8),
                        child: new CircleAvatar(
                          backgroundImage: new Image.network(_thirddataEntity.data[position].target.user.avatarUrl,).image,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8,right: 8),
                        child: new Text(_thirddataEntity.data[position].target.user.name,style: new TextStyle(color: Colors.grey[500]),),
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: 8,top: 8,right: 8),
                        child: new Icon(Icons.access_time,size: 20,color: Colors.grey[500],),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Text(_thirddataEntity.data[position].updatedAt.substring(0,9),style: new TextStyle(color: Colors.grey[500]),softWrap: true,),
                      )
                    ],
                  ),
                  position == _thirddataEntity.data.length-1 && !thirdOver  ? ColorLoader(radius: 16,dotRadius: 6,) : new Container(),
                ],
              ))
          )
      ),
    );
  }

  _getPhoto(int position) {
    if(_thirddataEntity.data[position].cover != null){
      return new Container(margin: EdgeInsets.only(left: 8),
      child: new Image(image: new Image.network(_thirddataEntity.data[position].cover).image,width: 120,)
        ,);
    }else{
      return new Text("");
    }
  }

  _getFromIndex(int i) {
    if(i==0){
      return _dashboard();
    }else if(i == 1){
      return TeamView();
    }else if(i==2){
      return AllBookView();
    }else if(i==3){
      return AllDocView();
    }
  }

  _dashboard(){
    return new NestedScrollView(
      headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
        return <Widget>[
          new SliverAppBar(
            title: Text(widget.title),
            floating: true,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: _notificationEntity == null ? Icon(Icons.notifications,color: Colors.white,):
                Icon(Icons.notifications_active),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return new NotificationView();
                  }));
                },
              )
            ],
            bottom: new TabBar(
              tabs: <Widget>[
                new Tab(
                  //icon: new Icon(Icons.image_aspect_ratio),
                  text: "动态",
                ),
                new Tab(
                  //icon: new Icon(Icons.history),
                  text: "最近",
                ),
                new Tab(
                  //icon: new Icon(Icons.grain),
                  text: "发现",
                )
              ],controller: _tabController,
            ),
          ),
        ];
      },
      body: new TabBarView(
        controller: _tabController,
          children: <Widget>[
            new RefreshIndicator(
                child: Builder(builder: (BuildContext context){
                  return new CustomScrollView(
                    slivers: <Widget>[
                      firstLoading ? SliverFillRemaining(child: new Center(child: ColorLoader(radius: 15,dotRadius: 6,),),):
                      SliverList(
                        delegate: SliverChildBuilderDelegate((BuildContext context,int position){
                          return _getListData(position);
                        },childCount: _getLength()
                        ),
                      )
                    ],
                  );
                }),
                onRefresh: _onEventRefresh),
            new RefreshIndicator(
                child: new CustomScrollView(
                  slivers: <Widget>[
                    secondLoading ? SliverFillRemaining(child: new Center(child: ColorLoader(radius: 15,dotRadius: 6,),),):
                    SliverList(
                      delegate: SliverChildBuilderDelegate((BuildContext context,int position){
                        return _getHistoryData(position);
                      },childCount: _getDocLength(),),
                    ),
                  ],
                ),
                onRefresh: _onDocRefresh),
            new RefreshIndicator(
              child: new CustomScrollView(
                slivers: <Widget>[
                  thirdLoading ? SliverFillRemaining(child: new Center(child: ColorLoader(radius: 15,dotRadius: 6,),),):
                  SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext context,int position){
                      return _getNewsListItem(position);
                    },childCount: _getNesLength()),
                  )
                ],
              ),
              onRefresh: _onNewsRefresh,
            ),
          ]),);
  }

  @override
  void resultOfEvent(bool param0, param1, String s) {
    if(param0){
      setState(() {
        _event = param1;
        firstLoading = false;
      });
    }else{
      print(s);
    }
    if(s == SparrowException.LOGIN){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
        return _loginView();
      }));
    }
  }

  @override
  void resultOfHistoryDoc(bool param0, DocEntity docEntity, String ok) {
    if(param0){
      setState(() {
        _doc = docEntity;
        secondLoading = false;
      });
    }
  }

  @override
  void resultOfNews(bool param0, ThirddataEntity thirddataEntity, String ok) {
    if(param0){
      setState(() {
        _thirddataEntity = thirddataEntity;
        thirdLoading = false;
      });
    }
  }

  @override
  void resultOfMoreDoc(bool param0, DocEntity entity, String ok) {
    if(param0){
      if(entity.data.length == 0){
        secondOver = true;
      }
      setState(() {
        _doc.data.addAll(entity.data);
      });
    }
  }

  @override
  void resultOfMoreNews(bool param0, ThirddataEntity entity, String ok) {
    if(param0){
      if(entity.data.length == 0){
        thirdOver = true;
      }
      setState(() {
        _thirddataEntity.data.addAll(entity.data);
      });
    }
  }

  @override
  void resultOfMyInfo(bool param0, UserinfoEntity entity, String ok) {
    loginFirst = true;
    if(param0){
      setState(() {
        _userinfoEntity.data = entity.data;
      });
    }
  }

  _getLogOutView() {
    if(_event != null){
      return ListTile(
        onTap: (){
          _presenter.clearAll();
        },
        title: Text("退出登陆"),
      );
    }else{
      return new Container();
    }
  }

  @override
  void resultOfLogout() {
    UserinfoEntity userinfoEntity =  new UserinfoEntity();
    userinfoEntity.initData();
    FlutterWebviewPlugin _mWeb = new FlutterWebviewPlugin();
    _mWeb.cleanCookies();
    setState(() {
      _event = null;
      _doc = null;
      _userinfoEntity = userinfoEntity;
    });
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return _loginView();
    }));
  }

  _loginView(){
    return WebviewScaffold(url: Api.login,
      withLocalStorage: true,
      enableAppScheme: true,
      withZoom: true,
      withJavascript: true,
      allowFileURLs: true,
      userAgent: "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36",
      appBar:new AppBar(
        leading: new Container(),
        centerTitle: true ,
        title: new Text("登录 · 语雀"),),
      initialChild: new Center(child: ColorLoader(radius: 15,dotRadius: 6,),),
      appCacheEnabled: true,);
  }

  @override
  void resultOfNotification(bool param0, NotificationEntity entity, String ok) {
    if(param0){
      setState(() {
        _notificationEntity = entity;
      });
    }
  }

  getContent(int position) {
    if(_event.data[position].eventType == "publish_doc"){
      return getPublishDoc(position);
    }else if(_event.data[position].eventType == "watch_book"){
      if(_event.data[position].subject!=null){
        return getWatchBook(position);
      }else{
        return new Container();
      }
    }else if(_event.data[position].eventType == "follow_user"){
      return getFollowUser(position);
    }else if(_event.data[position].eventType == "like_doc"){
      return getLikeDoc(position);
    }else{
      String eventType = _event.data[position].eventType;
      return new Center(child: new Text("暂不支持$eventType的事件类型，请向我反馈问题，谢谢",style: TextStyle(color: Colors.grey),),);
    }
  }

  getPublishDoc(int position) {
     return new Column(
       children: <Widget>[
         new Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             new Row(
               children: <Widget>[
                 new Container(
                   margin: new EdgeInsets.only(right: 8),
                   child:new Container(width: 20,height: 20,
                     child: new CircleAvatar(
                       backgroundImage: new Image.network(_event.data[position].actor.avatarUrl,).image,
                     ),
                   ),
                 ),
                 new Text(_event.data[position].actor.name + "在 " + _event.data[position].book.name + " 发布了" + "文档"),
               ],
             )
           ],
         ),
         new Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             new Container(
               margin: EdgeInsets.only(left: 28),
               child: new Text(_getTimeFormat(_event.data[position].updatedAt),style: new TextStyle(color: Colors.grey,fontSize: 12),),
             ),
             new Divider(),
             new Container(
               width: double.infinity,
               margin: EdgeInsets.only(bottom: 8),
               child: new Text(_event.data[position].subject['title'],style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
             ),

             new Text(
               _event.data[position].subject['description'],
               softWrap: true,
               maxLines: 5,
               overflow: TextOverflow.ellipsis,
             ),
             new Container(
               alignment: Alignment.centerRight,
               width: double.infinity,
               child: new FlatButton(
                   onPressed: () {
                     String uri = "https://www.yuque.com/"+ _event.data[position].book.user.login + "/"+_event.data[position].secondSubject['slug'] +  "/" + _event.data[position].subject['slug'];
                     String title = _event.data[position].subject['title'];
                     _readArticle(uri,title);
                   },
                   child: new Text("查看全文",style: new TextStyle(color: Colors.blue),))
               ,)
           ],
         ),
       ],
     );
   }

  getWatchBook(int position) {
    return new Column(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(right: 8),
                  child:new Container(width: 20,height: 20,
                    child: new CircleAvatar(
                      backgroundImage: new Image.network(_event.data[position].actor.avatarUrl,).image,
                    ),
                  ),
                ),
                new Text(_event.data[position].actor.name + " 关注了知识库"),
              ],
            ),
          ],
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              width: double.infinity,
              margin: EdgeInsets.only(left:28,right: 16),
              alignment: Alignment.centerLeft,
              child: new Text("2019-1-1 12:22:11",style: TextStyle(color: Colors.grey,fontSize: 12),),
            ),
            new Divider(),
            getWatchBookContent(position),
          ],
        )
      ],
    );
  }

  getWatchBookContent(int position) {
    if(_event.data[position].subjects == null){
      return ListTile(
        onTap: (){
          String id = _event.data[position].subject["id"].toString();
          String title = _event.data[position].subject["name"];
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
            return new BookView(id: id,title: title,);
          }));
        },
        title: Text(_event.data[position].subject["name"],style: TextStyle(fontSize: 14)),
        trailing: new Text(_event.data[position].subject['watches_count'].toString() + "人关注",style: TextStyle(color: Colors.grey),),
      );
    }else{
      return MediaQuery.removePadding(context: context,
          removeTop: true,
          child: ListView.builder(itemBuilder: (BuildContext context,int mposition){
        return ListTile(
          onTap: (){
            String id = _event.data[position].subjects[mposition]["id"].toString();
            String title = _event.data[position].subjects[mposition]["name"];
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
              return new BookView(id: id,title: title,);
            }));
          },
          title: Text(_event.data[position].subjects[mposition]["name"],style: TextStyle(fontSize: 14),),
          trailing: new Text(_event.data[position].subjects[mposition]['watches_count'].toString() + "人关注",style: TextStyle(color: Colors.grey),),
        );
      },itemCount: _event.data[position].subjects.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),));
    }
  }

  getFollowUser(int position) {
    return new Column(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(right: 8),
                  child:new Container(width: 20,height: 20,
                    child: new CircleAvatar(
                      backgroundImage: new Image.network(_event.data[position].actor.avatarUrl,).image,
                    ),
                  ),
                ),
                new Text(_event.data[position].actor.name + " 关注了 " + _event.data[position].subject["name"]),
              ],
            ),
          ],
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              width: double.infinity,
              margin: EdgeInsets.only(left:28,right: 16),
              alignment: Alignment.centerLeft,
              child: new Text("2019-1-1 12:22:11",style: TextStyle(color: Colors.grey,fontSize: 12),),
            ),
            new Divider(),
            ListTile(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                  return new UserView(id: _event.data[position].subject["id"].toString(),);
                }));
              },
              leading: new CircleAvatar(
                backgroundImage: new Image.network(_event.data[position].subject["avatar_url"],).image,
              ),
              title: Text(_event.data[position].subject["name"]),
              subtitle: _event.data[position].subject["description"] == null ? null: Text(_event.data[position].subject["description"]) ,
              trailing: Text(_event.data[position].subject["followers_count"].toString() + "人关注",style: TextStyle(color: Colors.grey),),
            )
          ],
        )
      ],
    );
  }

  getLikeDoc(int position) {
    return new Column(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(right: 8),
                  child:new Container(width: 20,height: 20,
                    child: new CircleAvatar(
                      backgroundImage: new Image.network(_event.data[position].actor.avatarUrl,).image,
                    ),
                  ),
                ),
                new Text(_event.data[position].actor.name + "给 " + _event.data[position].subject["user"]["name"] + "的文档赞赏了稻谷"),
              ],
            )
          ],
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(left: 28),
              child: new Text(_getTimeFormat(_event.data[position].updatedAt),style: new TextStyle(color: Colors.grey,fontSize: 12),),
            ),
            new Divider(),
            new Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 8),
              child: new Text(_event.data[position].subject['title'],style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            new Text(
              _event.data[position].subject['description'],
              softWrap: true,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            new Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              child: new FlatButton(
                  onPressed: () {
                    String uri = "https://www.yuque.com/"+ _event.data[position].book.user.login + "/"+_event.data[position].secondSubject['slug'] +  "/" + _event.data[position].subject['slug'];
                    String title = _event.data[position].subject['title'];
                    _readArticle(uri,title);
                  },
                  child: new Text("查看全文",style: new TextStyle(color: Colors.blue),))
              ,)
          ],
        ),
      ],
    );
  }
}
