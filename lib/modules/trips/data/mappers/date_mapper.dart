import 'package:reckit_task/modules/trips/data/models/date_model.dart';
import 'package:reckit_task/modules/trips/domain/entities/date_entity.dart';

class DateMapper {
  static DateEntity toEntity(DateModel model) {
    return DateEntity(
      start: model.start,
      end: model.end,
    );
  }
}