import 'package:equatable/equatable.dart';
import 'date_entity.dart';
import 'participant_entity.dart';

class TripEntity extends Equatable {
  final String ?id, status,title,coverImage;
  final DateEntity? dates;
  final List<ParticipantEntity> ?participants;
  final int ? unfinishedTasks;

  const TripEntity({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        title,
        dates,
        participants,
        unfinishedTasks,
        coverImage,
      ];
}