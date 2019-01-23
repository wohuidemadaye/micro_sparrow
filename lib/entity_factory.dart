import 'package:micro_sparrow/model/Group_entity.dart';
import 'package:micro_sparrow/model/Doc_entity.dart';
import 'package:micro_sparrow/model/Team_entity.dart';
import 'package:micro_sparrow/model/Book_entity.dart';
import 'package:micro_sparrow/model/Token_entity.dart';
import 'package:micro_sparrow/model/AllBook_entity.dart';
import 'package:micro_sparrow/model/ThirdData_entity.dart';
import 'package:micro_sparrow/model/EventEntity.dart';
import 'package:micro_sparrow/model/AllDoc_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "GroupEntity") {
      return GroupEntity.fromJson(json) as T;
    } else if (T.toString() == "DocEntity") {
      return DocEntity.fromJson(json) as T;
    } else if (T.toString() == "TeamEntity") {
      return TeamEntity.fromJson(json) as T;
    } else if (T.toString() == "BookEntity") {
      return BookEntity.fromJson(json) as T;
    } else if (T.toString() == "TokenEntity") {
      return TokenEntity.fromJson(json) as T;
    } else if (T.toString() == "AllbookEntity") {
      return AllbookEntity.fromJson(json) as T;
    } else if (T.toString() == "ThirddataEntity") {
      return ThirddataEntity.fromJson(json) as T;
    } else if (T.toString() == "EventEntity") {
      return EventEntity.fromJson(json) as T;
    } else if (T.toString() == "AlldocEntity") {
      return AlldocEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}