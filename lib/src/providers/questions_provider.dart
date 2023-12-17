import 'package:flutter/foundation.dart';

class Question extends ChangeNotifier {
  final String questionText;
  final List<String> alternatives;
  final int correctAlternativeIndex;
  late String _playerResponse;

  Question({
    required this.questionText,
    required this.alternatives,
    required this.correctAlternativeIndex,
    String? playerResponse,
  }) : _playerResponse = playerResponse ?? '';

  String get playerResponse => _playerResponse;

  set playerResponse(String value) {
    _playerResponse = value;
    notifyListeners();
  }
}

class QuestionsProvider with ChangeNotifier {
  final List<Question> _questions = [];
  int _correctAnswersCount = 0;

  QuestionsProvider() {
    _questions.add(Question(
        questionText: "¿Cuál es la capital de Francia?",
        alternatives: ["Madrid", "Londres", "París", "Berlín"],
        correctAlternativeIndex: 2,
        playerResponse: ''));
    _questions.add(Question(
        questionText: "¿Cuánto es 2 + 2?",
        alternatives: ["4", "0", "10", "5"],
        correctAlternativeIndex: 0,
        playerResponse: ''));
    _questions.add(Question(
        questionText:
            "¿Cuál es el guerrero más poderoso de todos los Universos?",
        alternatives: ["Superman", "Goku", "Ryu", "Capitana Marvel"],
        correctAlternativeIndex: 1,
        playerResponse: ''));
    _questions.add(Question(
        questionText: "¿Cuál es el país más poblado del mundo?",
        alternatives: ["Estados Unidos", "Rusia", "India", "China"],
        correctAlternativeIndex: 2,
        playerResponse: ''));
  }

  List<Question> get questions => _questions;

  int get correctAnswersCount => _correctAnswersCount;

  void updatePlayerResponse(int questionIndex, String value) {
    _questions[questionIndex].playerResponse = value;
    if (value == 'correcta') {
      _correctAnswersCount++;
    }
    notifyListeners();
  }

  void resetCorrectAnswersCount() {
    _correctAnswersCount = 0;
    for (var question in questions) {
      question.playerResponse = '';
    }
    notifyListeners();
  }
}
