import 'dart:math';
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/json_loader_service.dart';

class QuizProvider extends ChangeNotifier {
  final JsonLoaderService _jsonLoader = JsonLoaderService();
  
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _selectedAnswerIndex = -1;
  bool _hasAnswered = false;
  bool _isCorrect = false;
  int _score = 0;
  List<int> _wrongAnswers = [];
  String _currentChallengeId = '';
  bool _isLoading = false;

  // Getters
  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get currentQuestionNumber => _currentQuestionIndex + 1;
  int get totalQuestions => _questions.length;
  int get selectedAnswerIndex => _selectedAnswerIndex;
  bool get hasAnswered => _hasAnswered;
  bool get isCorrect => _isCorrect;
  int get score => _score;
  List<int> get wrongAnswers => _wrongAnswers;
  String get currentChallengeId => _currentChallengeId;
  bool get isLoading => _isLoading;
  bool get isQuizActive => _questions.isNotEmpty;
  bool get isLastQuestion => _currentQuestionIndex >= _questions.length - 1;
  
  Question? get currentQuestion => 
      _questions.isNotEmpty && _currentQuestionIndex < _questions.length
          ? _questions[_currentQuestionIndex]
          : null;
  
  double get progressPercentage => 
      _questions.isEmpty ? 0 : (_currentQuestionIndex + 1) / _questions.length;
  
  int get correctAttemptsCount => _score;

  Future<void> startQuiz(String challengeId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentChallengeId = challengeId;
      _questions = await _jsonLoader.loadQuestions(challengeId);
      
      // Shuffle questions for variety
      _questions.shuffle(Random());
      
      _currentQuestionIndex = 0;
      _score = 0;
      _wrongAnswers = [];
      _selectedAnswerIndex = -1;
      _hasAnswered = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectAnswer(int index) {
    if (_hasAnswered) return;
    
    _selectedAnswerIndex = index;
    _hasAnswered = true;
    
    final question = currentQuestion;
    if (question != null) {
      _isCorrect = question.checkAnswer(index);
      if (_isCorrect) {
        _score++;
      } else {
        _wrongAnswers.add(question.id);
      }
    }
    
    notifyListeners();
  }

  bool moveToNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _selectedAnswerIndex = -1;
      _hasAnswered = false;
      _isCorrect = false;
      notifyListeners();
      return true;
    }
    return false;
  }

  void resetQuiz() {
    _questions = [];
    _currentQuestionIndex = 0;
    _selectedAnswerIndex = -1;
    _hasAnswered = false;
    _isCorrect = false;
    _score = 0;
    _wrongAnswers = [];
    _currentChallengeId = '';
    notifyListeners();
  }

  void quitQuiz() {
    resetQuiz();
  }
}
