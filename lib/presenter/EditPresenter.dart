import 'package:micro_sparrow/Api.dart';
import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/View/IEditView.dart';
import 'package:micro_sparrow/model/CreateDoc_entity.dart';
import 'package:micro_sparrow/model/DocDetailSerializer_entity.dart';
import 'package:micro_sparrow/presenter/AbsPresenter.dart';

class EditPresenter extends AbsPresenter implements IPresenter{

  IEditView _view;
  DocdetailserializerEntity _detail;

  void setEntity(DocdetailserializerEntity entity){
    this._detail = entity;
  }


  @override
  init(IView view) {
    this._view = view;
  }

  void createDoc(String id,CreatedocEntity doc) async{
    if(_detail == null || _detail.data==null){
      var result = await postHttpData(Api.createDoc(id), doc.toJson());
      _detail = DocdetailserializerEntity.fromJson(result);
    }
    updateDoc(id,doc);
  }

  void updateDoc(String id,CreatedocEntity doc) async{
    String url = Api.updateDoc(id, _detail.data.id.toString());
    await putHttpData(url, doc.toJson());
    _view.reslutOfPost(true,"保存成功");
  }


}