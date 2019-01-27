import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/Utils/SparrowException.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/INotificationView.dart';
import 'package:micro_sparrow/model/Notification_entity.dart';
import 'package:micro_sparrow/presenter/AbsPresenter.dart';

class NotificationPresenter extends AbsPresenter implements IPresenter{

  INotificationView _view;

  @override
  init(IView view) {
    this._view = view;
  }

  void getNotification() async{
    var result = await getCookieHttpData(Api.unReadNotification);
    NotificationEntity entity = new NotificationEntity.fromJson(result);
    if(entity == null){
      _view.resultOfNoti(false,null,SparrowException.NETWORK_ERROR);
      return;
    }
    _view.resultOfNoti(true,entity,SparrowException.OK);
  }

  void confirm(num subjectId,num notiId) async {
    String url = "https://www.yuque.com/api/group_users/"+ subjectId.toString() + "/accept";
    //在处理请求之后，通过访问下面的url来让消息已读
    String delNoti = "https://www.yuque.com/go/notification/" + notiId.toString();
    var result = await putHttpCsrfData(url, "");
    await getCookieHttpData(delNoti);
  }

  void remove(num notiId) async {
    String delNoti = "https://www.yuque.com/go/notification/" + notiId.toString();
    var result = await getCookieHttpData(delNoti);
    print(result);
  }



}