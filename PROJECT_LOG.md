# Learn AI-ML Project Log

> **Session Date:** April 7, 2026  
> **Project:** Learn AI-ML - Flutter-based ML Quiz App  
> **GitHub:** https://github.com/Raman21676/learn-ai-ml

---

## Project Overview

A Flutter mobile application for learning AI/ML concepts through interactive MCQ quizzes. The app is structured in LEVELS, each containing multiple CHALLENGES with 50 questions each.

### Current Structure
```
LEVEL 1 (AI-ML Fundamentals) - 4 Challenges, 200 questions
├── C01: Foundations of Generative AI Systems (50 questions)
├── C02: Building Web APIs with Modern Python Framework (50 questions)
├── C03: Deploying and Managing AI Models (50 questions)
└── C04: Type Safety in AI Application Development (50 questions)

LEVEL 2 (Intermediate ML Concepts) - 2 Challenges, 100 questions
├── C05: The Machine Learning Landscape (50 questions) ✅ Added today
└── C06: End-to-End Machine Learning Project (50 questions) ✅ Added today

Total: 6 Challenges, 300 questions
```

---

## Today's Activities (April 7, 2026)

### Activity 1: Extracted Chapter 1 Content
- **Source:** Hands-On Machine Learning book (Chapter 1: The Machine Learning Landscape)
- **Pages:** 21-67
- **Extracted to:** `/Users/kalikali/Desktop/chapter1_ml_landscape.txt` (60,464 characters)
- **Content includes:**
  - What is Machine Learning (Arthur Samuel, Tom Mitchell definitions)
  - Why use ML (spam filter example)
  - Types of ML: Supervised, Unsupervised, Semi-supervised, Self-supervised, Reinforcement
  - Batch vs Online Learning
  - Instance-based vs Model-based Learning
  - Challenges: Overfitting, Underfitting, Data quality
  - Testing and Validation

### Activity 2: Created Challenge C05 (50 Questions)
- **File:** `assets/questions/challenge_05.json`
- **Topics covered:**
  - ML definitions and history
  - Supervised vs Unsupervised learning
  - Types of learning tasks (Classification, Regression, Clustering)
  - Batch vs Online learning
  - Instance-based vs Model-based learning
  - Overfitting, Underfitting, Regularization
  - Hyperparameters
  - Data validation techniques
- **Answer distribution:** 13 A, 13 B, 12 C, 12 D

### Activity 3: Added LEVEL 2 Support to UI
- Created `assets/data/level2_data.json`
- Created `assets/data/all_levels.json`
- Updated `lib/models/challenge_data.dart` with level2 data
- Updated `lib/utils/constants.dart` with LEVEL 2 strings
- Updated `lib/screens/level_screen.dart` to accept levelId parameter
- Updated `lib/screens/level_selection_screen.dart` with LEVEL 2
- Updated `lib/screens/home_screen.dart` - removed direct level display (only via Start Quiz)
- Updated `lib/screens/results_screen.dart` navigation to correct level
- Updated `lib/services/json_loader_service.dart` for level data loading
- Updated `pubspec.yaml` to include assets/data/ directory

### Activity 4: Extracted Chapter 2 Content
- **Source:** Hands-On Machine Learning book (Chapter 2: End-to-End Machine Learning Project)
- **Pages:** 68-117
- **Extracted to:** `/Users/kalikali/Desktop/chapter2_ml_project.txt` (66,862 characters)
- **Content includes:**
  - 8 steps of ML project workflow
  - Data pipelines
  - RMSE, MAE performance measures
  - Stratified sampling
  - Handling missing values
  - Scikit-Learn design principles

### Activity 5: Created Challenge C06 (50 Questions)
- **File:** `assets/questions/challenge_06.json`
- **Topics covered:**
  - 8 main steps of ML projects
  - Data pipelines
  - RMSE vs MAE performance measures
  - Stratified sampling vs random sampling
  - Data snooping bias
  - Handling missing values (SimpleImputer, KNNImputer, IterativeImputer)
  - OrdinalEncoder vs OneHotEncoder
  - Scikit-Learn design (Estimators, Transformers, Predictors)
  - Feature scaling
- **Answer distribution:** 14 A, 13 B, 10 C, 13 D

---

## Problems Encountered & Solutions

### Problem 1: Unbalanced Answer Distribution
**Issue:** Initial question generation had 43 B answers, 7 C answers, 0 A/D answers.  
**Solution:** Manually redistributed correct answers to achieve balance (12-14 per option).

### Problem 2: Missing assets/data/ Directory
**Issue:** level2_data.json couldn't be loaded because assets/data/ wasn't in pubspec.yaml.  
**Solution:** Added `- assets/data/` to pubspec.yaml flutter.assets section.

### Problem 3: LevelScreen Required Parameter
**Issue:** After adding levelId parameter to LevelScreen, existing navigation calls broke.  
**Solution:** Updated all navigation calls to pass levelId, calculated from challenge number (C01-C04 = level 1, C05+ = level 2).

### Problem 4: Copyright Compliance
**Issue:** Book content extraction includes page numbers and references that shouldn't be in public repo.  
**Solution:** 
- No book titles, author names, or chapter references in question JSON files
- Questions written as "internet research using multiple LLM models"
- Raw text extraction files stored locally (not in git)

### Problem 5: Home Screen Layout
**Issue:** User didn't want levels/challenges displayed directly on home screen.  
**Solution:** Removed _buildLevelSection and _buildChallengePreview methods from home_screen.dart. Levels now only accessible via "Start Quiz" button.

---

## File Structure

```
Learn AI-ML/
├── android/                  # Android-specific files
├── assets/
│   ├── data/
│   │   ├── all_levels.json          # All levels metadata
│   │   ├── level1_data.json         # Level 1 challenges metadata
│   │   └── level2_data.json         # Level 2 challenges metadata
│   ├── questions/
│   │   ├── challenge_01.json        # 50 questions - Gen AI Foundations
│   │   ├── challenge_02.json        # 50 questions - Python Web APIs
│   │   ├── challenge_03.json        # 50 questions - Model Deployment
│   │   ├── challenge_04.json        # 50 questions - Type Safety
│   │   ├── challenge_05.json        # 50 questions - ML Landscape ⭐ NEW
│   │   └── challenge_06.json        # 50 questions - End-to-End ML ⭐ NEW
│   ├── animations/           # Lottie animations
│   └── images/               # App images
├── lib/
│   ├── models/
│   │   ├── challenge_data.dart      # Level and Challenge models
│   │   └── question.dart            # Question model
│   ├── providers/
│   │   ├── progress_provider.dart   # User progress state
│   │   ├── theme_provider.dart      # Dark/light mode
│   │   └── user_provider.dart       # User settings
│   ├── screens/
│   │   ├── home_screen.dart         # Main home screen
│   │   ├── level_screen.dart        # Challenge list for a level
│   │   ├── level_selection_screen.dart  # Level picker
│   │   ├── quiz_screen.dart         # Quiz interface
│   │   ├── feedback_screen.dart     # Correct/incorrect feedback
│   │   ├── results_screen.dart      # Quiz completion results
│   │   ├── progress_screen.dart     # User progress stats
│   │   └── settings_screen.dart     # App settings
│   ├── services/
│   │   └── json_loader_service.dart # Load questions from JSON
│   ├── utils/
│   │   └── constants.dart           # App strings, colors, themes
│   └── main.dart
├── test/
├── pubspec.yaml
├── PROJECT_LOG.md             # ⭐ THIS FILE
└── README.md
```

---

## Git Commit History (Today)

```
81570a1 - Add Chapter 2: End-to-End Machine Learning Project (50 questions)
c0cdb1b - Remove level sections from home screen
f303e9b - Add LEVEL 2 support to UI
3ae49fc - Add LEVEL 2 Challenge C05: The ML Landscape (50 questions)
```

---

## Key Technical Details

### Challenge ID Format
- Challenges are numbered C01, C02, C03, etc.
- JSON files named: `challenge_01.json`, `challenge_02.json`, etc.
- Challenge IDs 1-4 belong to LEVEL 1
- Challenge IDs 5+ belong to LEVEL 2

### JSON Question Format
```json
{
  "challengeId": "C05",
  "challengeName": "The Machine Learning Landscape",
  "totalQuestions": 50,
  "questions": [
    {
      "id": 1,
      "question": "Question text here?",
      "options": ["Option A", "Option B", "Option C", "Option D"],
      "correctIndex": 0,
      "explanation": "Detailed explanation here."
    }
  ]
}
```

### Level Data Format
```json
{
  "levelId": 2,
  "levelName": "LEVEL 2",
  "subtitle": "Intermediate ML Concepts",
  "totalChallenges": 2,
  "challenges": [
    {
      "challengeId": "C05",
      "title": "The ML Landscape",
      "description": "...",
      "totalQuestions": 50,
      "timeLimit": 15,
      "requiredScore": 35,
      "icon": "school",
      "questions": []
    }
  ]
}
```

---

## Testing Device
- **Device:** CPH1801 (OPPO A3s)
- **Android Version:** 7.1.1
- **Connection:** USB debugging enabled

### ADB Commands Used
```bash
# Install debug APK
adb install -r build/app/outputs/flutter-apk/app-debug.apk

# Launch app
adb shell am start -n com.learnaiml.learn_ai_ml/.MainActivity

# Take screenshot
adb shell screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png ~/Desktop/screenshot.png

# Simulate taps
adb shell input tap 360 600

# Simulate swipe
adb shell input swipe 360 800 360 400

# Back button
adb shell input keyevent KEYCODE_BACK
```

---

## Dependencies
```yaml
flutter: sdk
shared_preferences: 2.2.2
provider: ^6.1.1
google_fonts: ^6.1.0
flutter_animate: ^4.5.0
lottie: ^3.1.0
confetti: ^0.7.0
intl: ^0.19.0
```

---

## Activities (April 9, 2026)

### Activity 1: Created Challenge C07 (50 Questions)
- **File:** `assets/questions/challenge_07.json`
- **Title:** Classification
- **Topics covered:**
  - MNIST dataset and binary/multiclass classification
  - Confusion Matrix, Accuracy, Precision, Recall
  - F1 Score and Precision/Recall tradeoff
  - ROC curves, AUC, Precision-Recall curves
  - One-vs-Rest (OvR) and One-vs-One (OvO) strategies
  - Multilabel and Multioutput classification
  - Cross-validation and Stratified k-fold
  - Error analysis and classification metrics
- **Answer distribution:** 12 A, 13 B, 12 C, 13 D

### Activity 2: Created Challenge C08 (50 Questions)
- **File:** `assets/questions/challenge_08.json`
- **Title:** Training Models
- **Topics covered:**
  - Linear Regression: Normal Equation and Gradient Descent
  - Batch, Stochastic, and Mini-batch Gradient Descent
  - Feature Scaling and Learning Rate tuning
  - Polynomial Regression and overfitting risks
  - Learning Curves and Bias-Variance Tradeoff
  - Regularization: Ridge (L2), Lasso (L1), Elastic Net
  - Early Stopping
  - Logistic Regression and Softmax Regression
- **Answer distribution:** 12 A, 13 B, 12 C, 13 D

### Activity 3: Updated UI and Data Files
- Updated `lib/models/challenge_data.dart` with C07 and C08
- Updated `assets/data/level2_data.json` (now 4 challenges)
- Updated `assets/data/all_levels.json` (totalChallenges: 4 for Level 2)
- Updated `lib/screens/home_screen.dart` (8 challenges, 400+ questions)
- Updated `lib/screens/settings_screen.dart` (400 questions across 8 challenges)
- Updated `lib/screens/progress_screen.dart` to show both Level 1 and Level 2 progress
- Updated `README.md` with new challenge list

### Activity 4: Created Challenge C09 (50 Questions)
- **File:** `assets/questions/challenge_09.json`
- **Title:** Support Vector Machines
- **Topics covered:**
  - Large margin classification and Support Vectors
  - Hard margin vs Soft margin classification
  - C hyperparameter and regularization
  - LinearSVC vs SVC
  - Kernel trick: Polynomial and RBF kernels
  - Gamma hyperparameter
  - SVM Regression (SVR)
  - Feature scaling importance
  - SVM computational complexity
- **Answer distribution:** 12 A, 13 B, 12 C, 13 D

### Current Structure
```
LEVEL 1 (AI-ML Fundamentals) - 4 Challenges, 200 questions
LEVEL 2 (Intermediate ML Concepts) - 8 Challenges, 400 questions
Total: 12 Challenges, 600 questions
```

---

## Next Steps / TODO

1. **Chapter 5:** Extract and create questions for Support Vector Machines
2. **Add More Levels:** Continue adding chapters as LEVEL 3, 4, etc.
3. **Question Randomization:** Currently questions appear in fixed order
4. **Timer Feature:** Add countdown timer for quizzes
5. **Leaderboard:** Add global/local leaderboard
6. **Offline Sync:** Sync progress when back online
7. **Dark Mode Polish:** Ensure all screens look good in dark mode

---

## Important Notes for Future Agents

1. **Copyright Compliance:** Never include book titles, author names, or page numbers in public files. Questions should appear as "internet research using multiple LLM models."

2. **Answer Distribution:** Always verify questions have balanced answer distribution (12-13 per option) before committing.

3. **JSON Validation:** Run `flutter build apk` after adding new questions to catch JSON syntax errors.

4. **UI Testing:** Test on actual device (CPH1801) as emulator may behave differently.

5. **Git Workflow:** 
   - Make commits atomic (one feature per commit)
   - Include descriptive commit messages
   - Push to main branch after each major feature

6. **Challenge Numbering:** Always use zero-padded numbers (C05, C06) for consistent sorting.

7. **Level Assignment:** 
   - C01-C04 → LEVEL 1
   - C05-C08 → LEVEL 2 (currently C05-C06)
   - C09-C12 → LEVEL 3 (future)

---

## Contact / Resources

- **GitHub Repository:** https://github.com/Raman21676/learn-ai-ml
- **Book Source:** Hands-On Machine Learning (stored locally, not in repo)
- **Extracted Content Location:** `/Users/kalikali/Desktop/chapter1_ml_landscape.txt`, `/Users/kalikali/Desktop/chapter2_ml_project.txt`

---

*Last Updated: April 7, 2026 by AI Agent*  
*Next Session: Continue with Chapter 3 or add features*
