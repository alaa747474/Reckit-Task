class DateModel {
  final String? start, end;

  DateModel({required this.start, required this.end});

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(start: json['start'], end: json['end']);
  }
}
