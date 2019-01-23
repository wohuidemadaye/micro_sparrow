import 'package:flutter/material.dart';
import 'package:micro_sparrow/View/GroupView.dart';
import 'package:micro_sparrow/View/ITeamView.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';
import 'package:micro_sparrow/presenter/TeamPresenter.dart';
import 'package:micro_sparrow/model/Team_entity.dart';




class TeamView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _teamPage();
  }


}

// ignore: camel_case_types
class _teamPage extends State<TeamView> implements ITeamView{

  TeamPresenter presenter = new TeamPresenter();
  TeamEntity teamEntity = new TeamEntity();
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    presenter.init(this);
    presenter.getTeamHttpData();
  }


  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          title: new Text("团队"),
          floating: false,
          pinned: true,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add,color: Colors.white,),
              onPressed: (){
              },
            )
          ],
        ),
        Builder(builder: (BuildContext context){
          return isLoading ? SliverFillRemaining(child: new Center(child: ColorLoader(radius: 15,dotRadius: 6,),),) :
          new SliverList(
              delegate:SliverChildBuilderDelegate((BuildContext context,int position){
                return _getTeamItem(position);
              },childCount: _getTeamLength())
          );
        }),
      ],
    );
  }

  Widget _getTeamItem(int position) {
    return new InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return new GroupView(
            imageUrl: teamEntity.data[position].avatarUrl,
            id: teamEntity.data[position].id.toString(),
            title: teamEntity.data[position].name,
            peopleNum: teamEntity.data[position].membersCount.toString(),
            subscripe: teamEntity.data[position].description,
            );
          }));
        },
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: Hero(tag: teamEntity.data[position].id.toString(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(teamEntity.data[position].avatarUrl),
                  )
              ),
              title: new Text(teamEntity.data[position].name),
              subtitle: new Text(teamEntity.data[position].description),
              trailing: _getLock(position),
            ),
            new Divider(height: 1,)
          ],
        )
    );
  }

  @override
  void getTeamHttpResult(body, bool param1) {
    if(param1){
      setState(() {
        teamEntity = TeamEntity.fromJson(body);
        isLoading = false;
        if(teamEntity.data.length == 0){
          print("team is null ");
        }else{
          print("get teams data successfully");
        }
      });
    }
  }

  _getTeamLength() {
    if(teamEntity.data == null || teamEntity.data.length ==null){
      return 0;
    }else{
      return teamEntity.data.length;
    }
  }

  _getLock(int position) {
    if(teamEntity.data[position].public == 0){
      return Icon(Icons.lock,color: Colors.blue,);
    }else{
      return Icon(Icons.lock_open,color: Colors.blue,);
    }
  }



}