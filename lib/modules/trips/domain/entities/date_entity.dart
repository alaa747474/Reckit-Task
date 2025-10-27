import 'package:equatable/equatable.dart';

class DateEntity extends Equatable {
  final String ?start;
  final String ?end;

  const DateEntity({
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [start, end];
}