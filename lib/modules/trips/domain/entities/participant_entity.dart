import 'package:equatable/equatable.dart';

class ParticipantEntity extends Equatable {
  final String? name, avatarUrl;

  const ParticipantEntity({required this.name, required this.avatarUrl});

  @override
  List<Object?> get props => [name, avatarUrl];
}
