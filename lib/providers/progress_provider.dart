import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question.dart';

class ProgressProvider extends ChangeNotifier {
  static const String _progressKey = 'quiz_progress';
  static const String _wrongAnswersKey = 'wrong_answers';
  static const String _dailyStreakKey = 'daily_streak';
  static const String _lastQuizDateKey = 'last_quiz_date';
  
  SharedPreferences? _prefs;
  Map<String, QuizProgress> _progress = {};
  List<String> _wrongAnswerIds = [];
  int _dailyStreak = 0;
  bool _todayCompleted = false;

  Map<String, QuizProgress> get progress => _progress;
  List<String> get wrongAnswerIds => _wrongAnswerIds;
  int get dailyStreak => _dailyStreak;
  bool get todayCompleted => _todayCompleted;
  bool get hasWrongAnswers => _wrongAnswerIds.isNotEmpty;
  int get wrongAnswersCount => _wrongAnswerIds.length;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadProgress();
    await _loadWrongAnswers();
    await _loadDailyStreak();
  }

  Future<void> _loadProgress() async {
    final progressJson = _prefs?.getString(_progressKey);
    if (progressJson != null) {
      final Map<String, dynamic> decoded = jsonDecode(progressJson);
      _progress = decoded.map((key, value) => 
        MapEntry(key, QuizProgress.fromJson(value))
      );
    }
  }

  Future<void> _saveProgress() async {
    final encoded = _progress.map((key, value) => 
      MapEntry(key, value.toJson())
    );
    await _prefs?.setString(_progressKey, jsonEncode(encoded));
  }

  Future<void> _loadWrongAnswers() async {
    final wrongJson = _prefs?.getString(_wrongAnswersKey);
    if (wrongJson != null) {
      _wrongAnswerIds = List<String>.from(jsonDecode(wrongJson));
    }
  }

  Future<void> _saveWrongAnswers() async {
    await _prefs?.setString(_wrongAnswersKey, jsonEncode(_wrongAnswerIds));
  }

  Future<void> _loadDailyStreak() async {
    _dailyStreak = _prefs?.getInt(_dailyStreakKey) ?? 0;
    final lastQuizDate = _prefs?.getString(_lastQuizDateKey);
    
    if (lastQuizDate != null) {
      final lastDate = DateTime.parse(lastQuizDate);
      final today = DateTime.now();
      
      // Check if already completed today
      if (lastDate.year == today.year && 
          lastDate.month == today.month && 
          lastDate.day == today.day) {
        _todayCompleted = true;
      } else if (today.difference(lastDate).inDays > 1) {
        // Streak broken
        _dailyStreak = 0;
        await _prefs?.setInt(_dailyStreakKey, 0);
      }
    }
  }

  Future<void> saveQuizProgress(String challengeId, int score, int total) async {
    final now = DateTime.now();
    
    _progress[challengeId] = QuizProgress(
      challengeId: challengeId,
      score: score,
      totalQuestions: total,
      percentage: (score / total) * 100,
      completedAt: now,
      isCompleted: true,
    );

    // Update daily streak
    if (!_todayCompleted) {
      _dailyStreak++;
      _todayCompleted = true;
      await _prefs?.setInt(_dailyStreakKey, _dailyStreak);
      await _prefs?.setString(_lastQuizDateKey, now.toIso8601String());
    }

    await _saveProgress();
    notifyListeners();
  }

  Future<void> addWrongAnswers(List<String> questionIds) async {
    for (final id in questionIds) {
      if (!_wrongAnswerIds.contains(id)) {
        _wrongAnswerIds.add(id);
      }
    }
    await _saveWrongAnswers();
    notifyListeners();
  }

  Future<void> removeWrongAnswer(String questionId) async {
    _wrongAnswerIds.remove(questionId);
    await _saveWrongAnswers();
    notifyListeners();
  }

  QuizProgress? getProgressForChallenge(String challengeId) {
    return _progress[challengeId];
  }

  double getOverallProgress() {
    if (_progress.isEmpty) return 0.0;
    final totalPercentage = _progress.values.fold<double>(
      0, (sum, p) => sum + p.percentage
    );
    return totalPercentage / _progress.length;
  }

  int get completedChallengesCount => _progress.values.where((p) => p.isCompleted).length;
  
  int getCompletedChallengesCount() {
    return completedChallengesCount;
  }
  
  int getCompletedChallengesForLevel(String levelId) {
    // Count completed challenges that belong to this level
    // Level IDs are like 'L1', 'L2', etc.
    // Challenge IDs for Level 1 are C01-C04, Level 2 are C05-C12, etc.
    final levelNum = int.tryParse(levelId.substring(1)) ?? 0;
    
    // Define challenge ranges for each level
    final ranges = {
      1: ['C01', 'C02', 'C03', 'C04'],
      2: ['C05', 'C06', 'C07', 'C08', 'C09', 'C10', 'C11', 'C12'],
      3: ['C13', 'C14', 'C15'],
      4: ['C16', 'C17', 'C18', 'C19', 'C20', 'C21', 'C22', 'C23', 'C24', 'C25', 'C26', 'C27'],
      5: ['C28', 'C29', 'C30', 'C31', 'C32', 'C33', 'C34', 'C35', 'C36', 'C37', 'C38', 'C39'],
      6: ['C40', 'C41', 'C42', 'C43', 'C44', 'C45', 'C46', 'C47', 'C48', 'C49'],
    };
    
    final challengeIds = ranges[levelNum] ?? [];
    return challengeIds.where((id) => _progress[id]?.isCompleted ?? false).length;
  }
}
