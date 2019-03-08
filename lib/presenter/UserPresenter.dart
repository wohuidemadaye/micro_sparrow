import 'package:micro_sparrow/Utils/Utils.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/IUserView.dart';
import 'package:micro_sparrow/model/BooksAndColumn.dart';
import 'package:micro_sparrow/model/FollowUserResponse.dart';
import 'package:micro_sparrow/model/Followed_entity.dart';
import 'package:micro_sparrow/model/User_entity.dart';
import 'package:micro_sparrow/model/Vo/FollowVo.dart';
import 'package:micro_sparrow/presenter/AbsPresenter.dart';
import 'package:micro_sparrow/model/Follow_entity.dart';
import 'dart:convert';

class UserPresenter extends AbsPresenter implements IPresenter{

  IUserView _view;

  @override
  init(IView view) {
    this._view = view;
  }

  void getUserData(String id) async{
    var result = await getTokenHttpData("https://www.yuque.com/api/v2/users/$id");
    UserEntity entity = new UserEntity.fromJson(result);
    if(entity == null){
      _view.resultOfUserData(false,null,"获取用户数据错误");
      return;
    }
    _view.resultOfUserData(true,entity,"OK");
  }

  void getBooksData(String booksId,int offset,int limit) async{
    //官方接口中 https://www.yuque.com/api/groups/105712/books?offset=0&limit=2&q=&type=
    //仅当limit = 2的时候才会显示第一条数据
    limit = limit + 1;
    var result = await getCookieHttpData("https://www.yuque.com/api/groups/$booksId/"
        "books?offset="+ offset.toString()+ "&limit="+limit.toString() + "&q=&type=");
    BooksAndColumnEntity booksAndColumnEntity = BooksAndColumnEntity.fromJson(result);
    if(booksAndColumnEntity == null){
      _view.resultOfBoosAndColumn(false,null,"获取知识库数据失败");
      return;
    }
    _view.resultOfBoosAndColumn(true,booksAndColumnEntity,"ok");
  }

  void getFollowUser(String userId,String offset) async{
    var result = await getCookieHttpData("https://www.yuque.com/api/actions/targets?action_type=follow&offset=$offset&target_type=User&user_id=$userId");
    FollowEntity followEntity = FollowEntity.fromJson(result);
    if(followEntity == null){
      _view.resultOfFollowUser(false,null,"获取关注的用户数据失败");
      return;
    }
    _view.resultOfFollowUser(true,followEntity,"ok");
  }

  void getFollowersUser(String userId,String offset) async{
    var result = await getCookieHttpData("https://www.yuque.com/api/actions/users?action_type=follow&offset=$offset&target_id=$userId&target_type=User");
    FollowEntity followEntity = FollowEntity.fromJson(result);
    if(followEntity == null){
      _view.resultOfFollowersUser(false,null,"获取关注者数据失败");
      return;
    }
    _view.resultOfFollowersUser(true,followEntity,"ok");
  }

  void isFollowedUsers(FollowEntity entity) async {
    //用户的id数组
    String idArray = "";
    Map<num,bool> isFollowed = new Map();
    for(int i=0;i<entity.data.length;i++){
      isFollowed[entity.data[i].id] = false;
      idArray = idArray + entity.data[i].id.toString() + ",";
    }
    var result = await getCookieHttpData("https://www.yuque.com/api/actions/user-owned?action_type=follow&target_ids=$idArray&target_type=User");
    FollowedEntity followedEntity = FollowedEntity.fromJson(result);
    if(followedEntity.data == null){
      _view.checkIsFollowed(false,null,"未知错误");
      return;
    }
    for(int i=0;i<followedEntity.data.length;i++){
      isFollowed[followedEntity.data[i].targetId] = true;
    }
    _view.checkIsFollowed(true,isFollowed,"ok");
  }

  void isFollowedUser(String id) async {
    Map<num,bool> isFollowed = new Map();
    isFollowed[int.parse(id)] = false;
    var result = await getCookieHttpData("https://www.yuque.com/api/actions/user-owned?action_type=follow&target_ids=$id&target_type=User");
    FollowedEntity followedEntity = FollowedEntity.fromJson(result);
    if(followedEntity.data.length == 1){
      isFollowed[int.parse(id)] = true;
    }
    _view.checkIsFollowed(true,isFollowed,"ok");
  }

  void followUser(num userId) async{
    FollowVo followVo = new FollowVo(actionType: "follow",targetType: "User",targetId: userId);
    var result = await postHttpCsrfData("https://www.yuque.com/api/actions",json.encode(followVo));
    FollowUserResponse response = FollowUserResponse.fromJson(result);
    if(Utils.checkNull(response)){
      _view.followUser(false,null,"网络错误");
      return;
    }
    _view.followUser(true,response,"ok");
  }
  
  void deleteFollowUser(num userId) async{
    FollowVo followVo = new FollowVo(actionType: "follow",targetType: "User",targetId: userId);
    await deleteHttpCsrfData("https://www.yuque.com/api/actions?action_type=follow&target_id=$userId&target_type=User", json.encode(followVo));
    _view.deleteFollowUser(true,followVo,"ok");
  }



}