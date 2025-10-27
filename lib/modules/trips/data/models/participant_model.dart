class ParticipantModel {
  final String? name, avatarUrl;

  ParticipantModel({required this.name, required this.avatarUrl});

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(name: json['name'], avatarUrl: json['avatar_url']);
  }
}
