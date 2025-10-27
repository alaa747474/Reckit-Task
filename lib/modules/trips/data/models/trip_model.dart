import 'package:reckit_task/modules/trips/data/models/date_model.dart';
import 'package:reckit_task/modules/trips/data/models/participant_model.dart';

class TripModel {
  final String? id, status, title, coverImage;
  final DateModel? dates;
  final List<ParticipantModel>? participants;
  final int? unfinishedTasks;

  TripModel({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      status: json['status'],
      title: json['title'],
      dates: DateModel.fromJson(json['dates']),
      participants: (json['participants'] as List<dynamic>).map((e) => ParticipantModel.fromJson(e)).toList(),
      unfinishedTasks: json['unfinished_tasks'],
      coverImage: json['cover_image'],
    );
  }
}
