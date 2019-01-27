import 'package:flutter/material.dart';
import 'package:micro_sparrow/View/INotificationView.dart';
import 'package:micro_sparrow/View/ITeamView.dart';
import 'package:micro_sparrow/model/Notification_entity.dart';
import 'package:micro_sparrow/presenter/NotificationPresenter.dart';

class NotificationView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _NotificationPage();
  }

}

class _NotificationPage extends State<NotificationView> implements INotificationView{

  NotificationEntity _entity;
  NotificationPresenter _presenter = new NotificationPresenter();

  @override
  void initState() {
    super.initState();
    _presenter.init(this);
    _presenter.getNotification();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("消息通知"),
        centerTitle: true,
      ),
      body: new ListView.builder(itemBuilder: (BuildContext context,int position){
        return getItem(position);
      },itemCount: getLength(),),
    );
  }

  Widget getItem(int position) {
    return Dismissible(key: new Key(position.toString()),
        onDismissed: (direction){
          _presenter.remove(_entity.data.notifications[position].id);
          _entity.data.notifications.removeAt(position);
        },
        child: Column(
          children: <Widget>[
            getContent(position),
            new Divider(height: 1,)
          ],
        )
    );
  }

  getLength() {
    if(_entity == null){
      return 0;
    }else{
      return _entity.data.notifications.length;
    }
  }

  @override
  void resultOfNoti(bool param0, NotificationEntity entity, String ok) {
    if(param0){
      setState(() {
        _entity = entity;
      });
    }
  }

  getContent(int position) {
    if(_entity.data.notifications[position].notifyType == "group_invitation"){
      return new ListTile(
        onTap: (){
        },
        leading: CircleAvatar(
          backgroundImage: Image.network(_entity.data.notifications[position].actor.avatarUrl).image,
        ),
        trailing: new InkWell(
          child: Icon(Icons.check,color: Colors.blue,),
          onTap: (){
            _presenter.confirm(_entity.data.notifications[position].subjectId,_entity.data.notifications[position].id);
            setState(() {
              _entity.data.notifications.removeAt(position);
            });
          },
        ),
        subtitle: Text(_entity.data.notifications[position].createdAt),
        title: Text.rich(TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: _entity.data.notifications[position].actor.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: " 邀请你加入 "
              ),
              TextSpan(
                text: _entity.data.notifications[position].secondSubject.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: " 团队 "
              ),
            ]
        )),
      );
    }else{
      return new ListTile(
        leading: CircleAvatar(
      backgroundColor: Colors.green,
      child: Icon(Icons.mood_bad,color: Colors.white,),
    ),
    title: Text("暂不支持的消息通知类型"),
    );
  }
  }


}