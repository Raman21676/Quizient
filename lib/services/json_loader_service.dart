import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/question.dart';

class JsonLoaderService {
  Future<List<Question>> loadQuestions(String challengeId) async {
    try {
      final String fileName = 'challenge_${challengeId.substring(1).padLeft(2, '0')}.json';
      final String jsonString = await rootBundle.loadString(
        'assets/questions/$fileName',
      );
      
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final List<dynamic> questionsJson = jsonData['questions'];
      
      return questionsJson.map((q) => Question.fromJson(q)).toList();
    } catch (e) {
      throw Exception('Failed to load questions for $challengeId: $e');
    }
  }

  Future<Challenge> loadChallenge(String challengeId) async {
    try {
      final String fileName = 'challenge_${challengeId.substring(1).padLeft(2, '0')}.json';
      final String jsonString = await rootBundle.loadString(
        'assets/questions/$fileName',
      );
      
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return Challenge.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load challenge $challengeId: $e');
    }
  }
}
