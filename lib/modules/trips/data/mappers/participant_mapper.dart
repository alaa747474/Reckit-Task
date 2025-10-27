import 'package:reckit_task/modules/trips/data/models/participant_model.dart';
import 'package:reckit_task/modules/trips/domain/entities/participant_entity.dart';

class ParticipantMapper {
  static ParticipantEntity toEntity(ParticipantModel model) {
    return ParticipantEntity(
      name: model.name,
      avatarUrl: model.avatarUrl,
    );
  }
}