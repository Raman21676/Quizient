class UserProfile {
  final String nickname;
  final DateTime joinedAt;
  final int totalQuizzesTaken;
  final int totalCorrectAnswers;

  UserProfile({
    this.nickname = '',
    required this.joinedAt,
    this.totalQuizzesTaken = 0,
    this.totalCorrectAnswers = 0,
  });

  double get accuracyRate => totalQuizzesTaken > 0
      ? (totalCorrectAnswers / (totalQuizzesTaken * 50)) * 100
      : 0;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      nickname: json['nickname'] ?? '',
      joinedAt: DateTime.parse(json['joinedAt']),
      totalQuizzesTaken: json['totalQuizzesTaken'] ?? 0,
      totalCorrectAnswers: json['totalCorrectAnswers'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'joinedAt': joinedAt.toIso8601String(),
      'totalQuizzesTaken': totalQuizzesTaken,
      'totalCorrectAnswers': totalCorrectAnswers,
    };
  }
}
