# Quizient

[![GitHub](https://img.shields.io/badge/GitHub-Quizient-blue?logo=github)](https://github.com/Raman21676/Quizient)

An offline Android quiz application for mastering AI-ML concepts through interactive MCQ challenges.

## Features

- **49 Challenges** - 2,450+ carefully crafted questions
- **6 Levels** - From beginner to advanced
- **Offline First** - No internet required
- **Progress Tracking** - Track your learning journey with daily streaks
- **Beautiful UI** - Modern design with animations
- **No Ads** - Completely free without advertisements

## Repository

**GitHub:** https://github.com/Raman21676/Quizient

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── challenge_data.dart   # Level & Challenge definitions
│   ├── question.dart         # Question & Quiz models
│   └── user_profile.dart     # User data
├── providers/                # State management
│   ├── progress_provider.dart
│   └── theme_provider.dart
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── level_screen.dart
│   ├── quiz_screen.dart
│   └── feedback_screen.dart
├── services/                 # Business logic
│   └── quiz_service.dart
└── utils/                    # Utilities
    ├── constants.dart
    └── theme.dart
```

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

## License

This project is for educational purposes.
