class TopicModel {
  int id;
  String topic;
  int userId;

  TopicModel({required this.id, required this.topic, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topic': topic,
      'userId': userId,
    };
  }
}
