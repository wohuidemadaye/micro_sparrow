import 'package:micro_sparrow/sparrow/EventEntity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "EventEntity") {
      return EventEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}