import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/model/BooksAndColumn.dart';
import 'package:micro_sparrow/model/FollowUserResponse.dart';
import 'package:micro_sparrow/model/Follow_entity.dart';
import 'package:micro_sparrow/model/User_entity.dart';
import 'package:micro_sparrow/model/Vo/FollowVo.dart';

abstract class IUserView implements IView{
  void resultOfUserData(bool param0, UserEntity entity, String s) {}

  void resultOfBoosAndColumn(bool param0, BooksAndColumnEntity booksAndColumnEntity, String s) {}

  void resultOfFollowUser(bool param0, FollowEntity followEntity, String s) {}

  void resultOfFollowersUser(bool param0, FollowEntity followEntity, String s) {}

  void checkIsFollowed(bool param0, Map<num, bool> isFollowed, String s) {}

  void followUser(bool param0, FollowUserResponse response, String s) {}

  void deleteFollowUser(bool param0, FollowVo followVo, String s) {}

}