class Score {
  int id;
  int score;
  String date;

  Score({required this.id, required this.score, required this.date});

  Map<String, dynamic> toMap() {
    return {'id': id, 'score': score, 'date': date};
  }
}
