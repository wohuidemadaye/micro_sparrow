import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/model/Doc_entity.dart';
import 'package:micro_sparrow/model/EventEntity.dart';
import 'package:micro_sparrow/model/Notification_entity.dart';
import 'package:micro_sparrow/model/ThirdData_entity.dart';
import 'package:micro_sparrow/model/UserInfo_entity.dart';

class IMainView implements IView{
  void resultOfEvent(bool param0, param1, String s) {}

  void resultOfHistoryDoc(bool param0, DocEntity docEntity, String ok) {}

  void resultOfNews(bool param0, ThirddataEntity thirddataEntity, String ok) {}

  void resultOfMoreDoc(bool param0, DocEntity entity, String ok) {}

  void resultOfMoreNews(bool param0, ThirddataEntity entity, String ok) {}

  void resultOfMyInfo(bool param0, UserinfoEntity entity, String ok) {}

  void resultOfLogout() {}

  void resultOfNotification(bool param0, NotificationEntity entity, String ok) {}
  

}