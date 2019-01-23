import 'package:micro_sparrow/model/Doc_entity.dart';
import 'package:micro_sparrow/model/ThirdData_entity.dart';
import 'package:micro_sparrow/model/EventEntity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "DocEntity") {
      return DocEntity.fromJson(json) as T;
    } else if (T.toString() == "ThirddataEntity") {
      return ThirddataEntity.fromJson(json) as T;
    } else if (T.toString() == "EventEntity") {
      return EventEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}