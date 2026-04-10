class Question {
  final String id;
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  String get correctAnswer => options[correctIndex];

  bool checkAnswer(int selectedIndex) => selectedIndex == correctIndex;

  factory Question.fromJson(Map<String, dynamic> json) {
    // Handle both int and string IDs (C01-C39 use int, C40-C49 use string)
    final dynamic rawId = json['id'];
    final String id = rawId is int ? rawId.toString() : rawId as String;
    
    return Question(
      id: id,
      questionText: json['question'] as String,
      options: List<String>.from(json['options'] as List),
      correctIndex: json['correctIndex'] as int,
      explanation: json['explanation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': questionText,
      'options': options,
      'correctIndex': correctIndex,
      'explanation': explanation,
    };
  }
}

class Challenge {
  final String id;
  final String name;
  final String description;
  final int totalQuestions;
  final List<Question> questions;
  final bool isLocked;

  Challenge({
    required this.id,
    required this.name,
    required this.description,
    required this.totalQuestions,
    required this.questions,
    this.isLocked = false,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['challengeId'] as String,
      name: json['challengeName'] as String,
      description: 'Master ${json['totalQuestions']} questions',
      totalQuestions: json['totalQuestions'] as int,
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList(),
      isLocked: false,
    );
  }
}

class QuizProgress {
  final String challengeId;
  final int score;
  final int totalQuestions;
  final double percentage;
  final DateTime completedAt;
  final bool isCompleted;

  QuizProgress({
    required this.challengeId,
    required this.score,
    required this.totalQuestions,
    required this.percentage,
    required this.completedAt,
    this.isCompleted = false,
  });

  factory QuizProgress.fromJson(Map<String, dynamic> json) {
    return QuizProgress(
      challengeId: json['challengeId'],
      score: json['score'],
      totalQuestions: json['totalQuestions'],
      percentage: json['percentage'],
      completedAt: DateTime.parse(json['completedAt']),
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'challengeId': challengeId,
      'score': score,
      'totalQuestions': totalQuestions,
      'percentage': percentage,
      'completedAt': completedAt.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }
}
