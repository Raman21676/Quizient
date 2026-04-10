import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStrings {
  static const String appName = 'Quizient';
  static const String appTagline = 'Master AI & ML through interactive quizzes';
  
  // Home Screen
  static const String welcomeBack = 'Welcome Back!';
  static const String startQuiz = 'Start Quiz';
  static const String continueLearning = 'Continue Learning';
  static const String viewProgress = 'View Progress';
  static const String settings = 'Settings';
  static const String quickActions = 'Quick Actions';
  static const String features = 'Features';
  static const String offlineLearning = 'Offline Learning';
  static const String offlineLearningDesc = 'Study anytime, anywhere without internet';
  static const String yourProgress = 'Your Progress';
  static const String challengesCompleted = 'challenges completed';
  
  // Quiz Screen
  static const String question = 'Question';
  static const String of = 'of';
  static const String next = 'Next';
  static const String finish = 'Finish';
  static const String quit = 'Quit';
  static const String quitConfirm = 'Are you sure you want to quit?';
  static const String quitWarning = 'Your progress will be saved.';
  static const String cancel = 'Cancel';
  
  // Feedback
  static const String correct = 'Correct!';
  static const String incorrect = 'Incorrect';
  static const String explanation = 'Explanation';
  static const String tapToContinue = 'Tap to continue';
  static const String wellDone = 'Well Done!';
  static const String keepLearning = 'Keep Learning!';
  
  // Results
  static const String quizComplete = 'Quiz Complete!';
  static const String yourScore = 'Your Score';
  static const String questionsCorrect = 'Questions Correct';
  static const String retry = 'Retry';
  static const String backToHome = 'Back to Home';
  static const String reviewMistakes = 'Review Mistakes';
  static const String shareResults = 'Share Results';
  
  // Level Screen
  static const String level1Title = 'LEVEL 1';
  static const String level1Subtitle = 'AI-ML Fundamentals: Core Concepts & Neural Networks';
  static const String level2Title = 'LEVEL 2';
  static const String level2Subtitle = 'Reinforcement Learning: From Basics to Advanced RL';
  static const String level3Title = 'LEVEL 3';
  static const String level3Subtitle = 'Data Structures & Algorithms for Technical Interviews';
  static const String level4Title = 'LEVEL 4';
  static const String level4Subtitle = 'Deep RL: DQN, Policy Gradients, Actor-Critic & PPO';
  static const String level5Title = 'LEVEL 5';
  static const String level5Subtitle = 'Large Language Models: Transformers, BERT, GPT & Fine-Tuning';
  static const String level6Title = 'LEVEL 6';
  static const String level6Subtitle = 'DevOps: Linux, CI/CD, Docker, Kubernetes & Cloud';
  static const String challenges = 'Challenges';
  static const String locked = 'Locked';
  static const String completed = 'Completed';
  static const String start = 'Start';
  static const String selectLevel = 'Select Level';
  static const String choosePath = 'Choose your learning path';
  
  // Progress
  static const String overallProgress = 'Overall Progress';
  static const String currentStreak = 'Current Streak';
  static const String day = 'day';
  static const String days = 'days';
  static const String masteryLevel = 'Mastery Level';
  static const String totalQuestions = 'Total Questions';
  static const String accuracy = 'Accuracy';
}

class AppColors {
  // Primary gradient colors
  static const Color primaryStart = Color(0xFF667EEA);
  static const Color primaryEnd = Color(0xFF764BA2);
  static const Color secondaryStart = Color(0xFF11998E);
  static const Color secondaryEnd = Color(0xFF38EF7D);
  
  // For backward compatibility
  static const Color primaryLight = Color(0xFF6750A4);
  static const Color secondaryLight = Color(0xFF009688);
  
  // Accent colors
  static const Color accent1 = Color(0xFFFF6B6B);
  static const Color accent2 = Color(0xFF4ECDC4);
  static const Color accent3 = Color(0xFFFFE66D);
  static const Color accent4 = Color(0xFF95E1D3);
  
  // Light theme
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Colors.white;
  static const Color textPrimaryLight = Color(0xFF2D3436);
  static const Color textSecondaryLight = Color(0xFF636E72);
  
  // Dark theme
  static const Color backgroundDark = Color(0xFF1A1A2E);
  static const Color surfaceDark = Color(0xFF16213E);
  static const Color textPrimaryDark = Color(0xFFEAEAEA);
  static const Color textSecondaryDark = Color(0xFFB8B8B8);
  
  // Common
  static const Color success = Color(0xFF00B894);
  static const Color error = Color(0xFFFF7675);
  static const Color warning = Color(0xFFFDCB6E);
  static const Color info = Color(0xFF74B9FF);
  
  // Level gradient colors
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
  
  static final List<List<Color>> levelGradients = [
    [const Color(0xFF667EEA), const Color(0xFF764BA2)], // Level 1 - Purple
    [const Color(0xFF11998E), const Color(0xFF38EF7D)], // Level 2 - Green
    [const Color(0xFFFF6B6B), const Color(0xFFFF8E53)], // Level 3 - Orange/Red
    [const Color(0xFF4ECDC4), const Color(0xFF44A08D)], // Level 4 - Teal
    [const Color(0xFFFF9A9E), const Color(0xFFFECFEF)], // Level 5 - Pink
    [const Color(0xFFFFA726), const Color(0xFFFF7043)], // Level 6 - Amber/Orange
  ];
  
  // Card gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryStart, primaryEnd],
  );
  
  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF00B894), Color(0xFF00CEC9)],
  );
  
  static const LinearGradient errorGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF7675), Color(0xFFFF6B6B)],
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryStart,
        secondary: AppColors.secondaryStart,
        surface: AppColors.surfaceLight,
        background: AppColors.backgroundLight,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimaryLight,
        onBackground: AppColors.textPrimaryLight,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: AppColors.textPrimaryLight,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: AppColors.textSecondaryLight,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColors.surfaceLight,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: AppColors.primaryStart,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          side: const BorderSide(color: AppColors.primaryStart, width: 2),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryEnd,
        secondary: AppColors.secondaryEnd,
        surface: AppColors.surfaceDark,
        background: AppColors.backgroundDark,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimaryDark,
        onBackground: AppColors.textPrimaryDark,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColors.surfaceDark,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: AppColors.primaryEnd,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// Animation durations
class AppDurations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);
}

// Spacing
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}
