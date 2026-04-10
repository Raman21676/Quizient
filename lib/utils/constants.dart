import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStrings {
  static const String appName = 'Learn AI-ML';
  static const String appTagline = 'Master AI concepts through practice';
  
  // Home Screen
  static const String startQuiz = 'Start Quiz';
  static const String continueLearning = 'Continue Learning';
  static const String viewProgress = 'View Progress';
  static const String settings = 'Settings';
  
  // Quiz Screen
  static const String question = 'Question';
  static const String of = 'of';
  static const String next = 'Next';
  static const String finish = 'Finish';
  static const String quit = 'Quit';
  static const String quitConfirm = 'Are you sure you want to quit?';
  static const String quitWarning = 'Your progress will be lost.';
  static const String cancel = 'Cancel';
  
  // Feedback
  static const String correct = 'Correct!';
  static const String incorrect = 'Incorrect';
  static const String explanation = 'Explanation';
  static const String tapToContinue = 'Tap to continue';
  
  // Results
  static const String quizComplete = 'Quiz Complete!';
  static const String yourScore = 'Your Score';
  static const String questionsCorrect = 'Questions Correct';
  static const String retry = 'Retry';
  static const String backToHome = 'Back to Home';
  static const String reviewMistakes = 'Review Mistakes';
  
  // Level Screen
  static const String level1Title = 'LEVEL 1';
  static const String level1Subtitle = 'AI-ML Fundamentals';
  static const String level2Title = 'LEVEL 2';
  static const String level2Subtitle = 'Intermediate ML Concepts';
  static const String level3Title = 'LEVEL 3';
  static const String level3Subtitle = 'DSA for Interviews';
  static const String level4Title = 'LEVEL 4';
  static const String level4Subtitle = 'Deep Reinforcement Learning';
  static const String level5Title = 'LEVEL 5';
  static const String level5Subtitle = 'Large Language Models';
  static const String challenges = 'Challenges';
  static const String locked = 'Locked';
  static const String completed = 'Completed';
  static const String start = 'Start';
  
  // Progress
  static const String overallProgress = 'Overall Progress';
  static const String challengesCompleted = 'Challenges Completed';
  static const String currentStreak = 'Current Streak';
  static const String day = 'day';
  static const String days = 'days';
}

class AppColors {
  // Light theme
  static const Color primaryLight = Color(0xFF6750A4);
  static const Color secondaryLight = Color(0xFF009688);
  static const Color surfaceLight = Color(0xFFFEF7FF);
  static const Color backgroundLight = Color(0xFFFDFDFD);
  
  // Dark theme
  static const Color primaryDark = Color(0xFFD0BCFF);
  static const Color secondaryDark = Color(0xFF80CBC4);
  static const Color surfaceDark = Color(0xFF141218);
  static const Color backgroundDark = Color(0xFF121212);
  
  // Common
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);
  
  // Challenge colors
  static const List<Color> challengeColors = [
    Color(0xFF6750A4), // Purple
    Color(0xFF2196F3), // Blue
    Color(0xFF009688), // Teal
    Color(0xFF4CAF50), // Green
    Color(0xFF8BC34A), // Light Green
    Color(0xFFFFC107), // Amber
    Color(0xFFFF9800), // Orange
    Color(0xFFFF5722), // Deep Orange
    Color(0xFFE91E63), // Pink
    Color(0xFF9C27B0), // Purple
    Color(0xFF3F51B5), // Indigo
    Color(0xFF00BCD4), // Cyan
    Color(0xFF795548), // Brown
  ];
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryLight,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryDark,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
