import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/model/Doc_entity.dart';
import 'package:micro_sparrow/model/ThirdData_entity.dart';

class IMainView implements IView{
  void resultOfEvent(bool param0, param1, String s) {}

  void resultOfHistoryDoc(bool param0, DocEntity docEntity, String ok) {}

  void resultOfNews(bool param0, ThirddataEntity thirddataEntity, String ok) {}

}