import 'package:micro_sparrow/Utils/mvp.dart';
import 'package:micro_sparrow/model/AllDoc_entity.dart';
import 'package:micro_sparrow/model/DocDetailSerializer_entity.dart';
import 'package:micro_sparrow/model/TocTree.dart';

class IBookView implements IView{
  void resultOfBook(bool param0, List<TocTree> body,String message) {}

  void resultOfAllDoc(bool param0, AlldocEntity entity, String ok) {}

  void resultOfDelDoc(bool param0, int position, String ok) {}

  void resultOfReadDoc(bool param0, DocdetailserializerEntity entity, String ok) {}


}