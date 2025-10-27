

import 'package:reckit_task/modules/trips/data/mappers/date_mapper.dart';
import 'package:reckit_task/modules/trips/data/models/trip_model.dart';
import 'package:reckit_task/modules/trips/domain/entities/trip_entity.dart';

import 'participant_mapper.dart';

class TripMapper {
  static TripEntity toEntity(TripModel model) {
    return TripEntity(
      id: model.id,
      status: model.status,
      title: model.title,
      dates: model.dates != null ? DateMapper.toEntity(model.dates!) : null,
      participants: model.participants
          ?.map((participant) => ParticipantMapper.toEntity(participant))
          .toList(),
      unfinishedTasks: model.unfinishedTasks,
      coverImage: model.coverImage,
    );
  }
}