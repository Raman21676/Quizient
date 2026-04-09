# Learn AI-ML

An offline Android quiz application for mastering AI-ML concepts through interactive MCQ challenges.

## Features

- **8 Challenges** - 400 carefully crafted questions
- **Offline First** - No internet required
- **Progress Tracking** - Track your learning journey
- **Dark Mode** - Comfortable learning day and night
- **Beautiful UI** - Modern Material 3 design with animations

## LEVEL 1: AI-ML Fundamentals

| Challenge | Name | Questions |
|-----------|------|-----------|
| C01 | Foundations of Generative AI Systems | 50 |
| C02 | Building Web APIs with Modern Python Framework | 50 |
| C03 | Deploying and Managing AI Models | 50 |
| C04 | Type Safety in AI Application Development | 50 |
| C05 | The Machine Learning Landscape | 50 |
| C06 | End-to-End Machine Learning Project | 50 |
| C07 | Classification | 50 |
| C08 | Training Models | 50 |

**Total: 400 Questions**

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
│   ├── quiz_provider.dart
│   ├── theme_provider.dart
│   └── user_provider.dart
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── level_screen.dart
│   ├── quiz_screen.dart
│   ├── feedback_screen.dart
│   ├── results_screen.dart
│   ├── progress_screen.dart
│   └── settings_screen.dart
├── services/                 # Business logic
│   └── json_loader_service.dart
└── utils/                    # Constants & helpers
    └── constants.dart
```

## Building

```bash
flutter pub get
flutter build apk --release
```

## Development

This app is built with Flutter and uses:
- Provider for state management
- SharedPreferences for local storage
- flutter_animate for animations
- confetti for celebration effects

## Future Expansion

The app is designed to support multiple levels. Future content can be added as:
- LEVEL 2: [Future Content]
- LEVEL 3: [Future Content]

---

**Status:** ✅ 400 Questions Ready for Testing
