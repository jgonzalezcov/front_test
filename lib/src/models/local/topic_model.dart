class TopicModelLocal {
  int id;
  String topic;
  int userId;
  String category;
  bool isPublic;
  String description;
  TopicModelLocal({
    required this.id,
    required this.topic,
    required this.userId,
    required this.category,
    required this.isPublic,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topic': topic,
      'userId': userId,
      'category': category,
      'isPublic': isPublic,
      'description': description
    };
  }
}
