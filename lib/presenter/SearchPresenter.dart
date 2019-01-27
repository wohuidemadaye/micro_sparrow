import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/Utils/SparrowException.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/ISearchView.dart';
import 'package:micro_sparrow/model/UserSearch_entity.dart';
import 'package:micro_sparrow/presenter/AbsPresenter.dart';

class SearchPresenter extends AbsPresenter implements IPresenter{

  ISearchView _view;

  @override
  init(IView view) {
    this._view = view;
  }

  void searchUser(String text) async{
    var result = await getCookieHttpData(Api.searchUser(text));
    UsersearchEntity entity = UsersearchEntity.fromJson(result);
    if(entity.data == null){
      _view.resultOfSearch(false,null,SparrowException.NETWORK_ERROR);
      return;
    }
    _view.resultOfSearch(true,entity,SparrowException.OK);
  }
  
  void inviteUser(String repoId,String login) async{
    String url = "https://www.yuque.com/api/v2/groups/$repoId/users/$login";
    print(url);
    var result = await putHttpData(url, '{"role": 1}');
    print(result);
    _view.resultOfInvite(true,null,SparrowException.OK);
  }

}