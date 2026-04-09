# Project Log: Learn AI-ML Flutter Quiz App

> This log documents all project activities, decisions, problems encountered, and solutions applied.
> Read this file first when resuming work on this project.

---

## Project Overview

**App Name:** Learn AI-ML  
**Platform:** Flutter offline Android quiz app  
**GitHub:** `Raman21676/learn-ai-ml`, branch `main`  
**Working Directory:** `/Users/kalikali/Desktop/Learn AI-ML/`

**Architecture:**
- State management: `provider` + `shared_preferences`
- UI animations: `flutter_animate`, `confetti`, `lottie`
- Fonts: `google_fonts`
- Assets: `assets/`, `assets/data/`, `assets/questions/`, `assets/animations/`, `assets/images/`

**Current Status (as of last session):**
- **4 Levels** | **27 Challenges** | **1,350 Questions**
- Level 1: 4 challenges (C01-C04) — AI-ML Fundamentals
- Level 2: 8 challenges (C05-C12) — Intermediate ML Concepts
- Level 3: 3 challenges (C13-C15) — DSA for Interviews
- Level 4: 12 challenges (C16-C27) — Deep Reinforcement Learning ✅ COMPLETE

---

## File Structure & Conventions

### Question Files
- Location: `assets/questions/challenge_XX.json` (XX = 01-27)
- Format: JSON with `challengeId`, `challengeName`, `totalQuestions`, `questions` array
- Each question has: `id` (1-50), `question`, `options` [4 strings], `correctIndex` (0-3), `explanation`
- Answer distribution target: ~12-13 per option (balanced)

### Level Data Files
- `assets/data/level1_data.json` through `level4_data.json`
- `assets/data/all_levels.json` — top-level registry with all levels
- Each must have correct `totalChallenges` count

### App Integration Files (MUST update when adding challenges)
1. `lib/models/challenge_data.dart` — Add ChallengeInfo to level constants
2. `lib/screens/level_screen.dart` — Add level routing for new levels
3. `lib/screens/level_selection_screen.dart` — Add level card
4. `lib/screens/progress_screen.dart` — Add progress section
5. `lib/screens/home_screen.dart` — Update challenge/question counts
6. `lib/utils/constants.dart` — Add level title/subtitle strings
7. `assets/data/levelN_data.json` — Add challenge metadata
8. `assets/data/all_levels.json` — Update totalChallenges

### Pre-existing Warnings (Non-blocking)
- `WillPopScope` deprecated in `feedback_screen.dart`, `quiz_screen.dart`, `results_screen.dart`
- Unused imports in `home_screen.dart`, `results_screen.dart`
- `widget_test.dart` references `MyApp` instead of `LearnAiMlApp`
- These existed BEFORE Level 4 work — do NOT try to fix unless explicitly asked

### Recurring Bug Pattern
When editing `home_screen.dart` strings, frequently forget trailing comma before `style:` parameter.
Pattern: `.'` instead of `.',`. Always verify syntax after editing.

---

## Level 4: Deep Reinforcement Learning — Creation Log

### Challenge Mapping (from PDF source: 24 lessons)
The PDF was analyzed and mapped to 12 challenges (2 lessons each):

| Challenge | Lessons | Topic |
|-----------|---------|-------|
| C16 | 1–2 | Introduction to Deep RL |
| C17 | 3–4 | Mathematical Foundations & MDPs |
| C18 | 5–6 | Rewards, Returns & Agent Objective |
| C19 | 7–8 | Exploration vs Exploitation |
| C20 | 9–10 | Evaluating Agents & Value Functions |
| C21 | 11–12 | Improving Agents & Agent Anatomy |
| C22 | 13–14 | TD Learning & Robust Targets |
| C23 | 15–16 | Value-Based Deep RL & Function Approximation |
| C24 | 17–18 | DQN & Stable Value-Based Methods |
| C25 | 19–20 | Sample-Efficient Methods (Dueling DDQN, PER) |
| C26 | 21–22 | Policy Gradient & REINFORCE |
| C27 | 23–24 | Advanced Actor-Critic (DDPG, TD3, SAC, PPO) |

### Copyright Compliance Policy
- **CRITICAL:** No book titles, author names, page numbers, or chapter references in public files
- Questions must appear as "internet research using multiple LLM models"
- Raw text extractions stored locally only (NOT in git)
- All questions are original content based on general RL knowledge — no copying from source material

---

## Problems Encountered & Solutions

### Problem 1: Duplicate Questions Across Files
**When:** First recheck after creating C18-C19  
**What:** C18 Q4 duplicated C16 Q39 (reward shaping), C18 Q7 duplicated C17 Q12 (return G_t), C21 Q11 duplicated C20 Q31 (GPI), C21 Q33 duplicated C18 Q16 (reward normalization)

**Solution:** Replaced duplicate questions with new original ones:
- C18 Q4 → Principle of optimality in RL
- C18 Q7 → Expected return vs sampled return in stochastic environments
- C21 Q11 → Actor-critic interaction (how critic helps actor)
- C21 Q33 → Gradient accumulation in deep RL training

### Problem 2: all_levels.json L4 totalChallenges Out of Sync
**When:** Multiple times during integration  
**What:** `StrReplaceFile` matched wrong `"totalChallenges": N` instance (e.g., hit L2 instead of L4)

**Solution:** Always use context-aware replacement with surrounding lines (levelId, levelName) to target the correct level. Final fix applied: L1=4, L2=8, L3=3, L4=12.

### Problem 3: C24 Duplicates with C22
**When:** Creating C24-C25  
**What:** C24 Q21 (Dueling DQN), Q28 (Rainbow DQN), Q29 (Rainbow components) duplicated C22 questions

**Solution:** Replaced with new questions:
- C24 Q21 → Why mean of advantages is subtracted in Dueling DQN
- C24 Q28 → Deadly triad in deep Q-learning and DQN mitigation
- C24 Q29 → Key difference between Ape-X and IMPALA architectures

### Problem 4: C26 Duplicate with C19
**When:** Creating C26-C27  
**What:** C26 Q23 (entropy regularization) duplicated C19 Q29

**Solution:** Replaced with log-derivative trick / likelihood ratio trick question

### Problem 5: Distribution Imbalance After Replacement
**When:** Fixing C24 and C26 duplicates  
**What:** After swapping correct answers, distribution became unbalanced (e.g., C24: {0:12, 1:16, 2:11, 3:13})

**Solution:** Ran post-fix rebalancing script that swaps correct answers between questions to restore target distribution (12/13/12/13 pattern)

### Problem 6: Nonsensical/Joke Options in Level 4
**When:** Deep recheck of Level 4  
**What:** Found 4 options that were jokes/metaphors instead of RL-relevant distractors:
- C16 Q11: "Calculating the agent's bank account"
- C16 Q46: "Moving money between bank accounts"
- C17 Q40: "Forecasting the weather"
- C20 Q32: "It uses a magic constant"

**Solution:** Replaced all with RL-relevant but incorrect options:
- C16 Q11 → "Tracking the number of states visited"
- C16 Q46 → "Combining multiple agents into one"
- C17 Q40 → "Predicting the next state transition probabilities"
- C20 Q32 → "The discount factor automatically approaches zero"

---

## Validation Process (Use Before Committing)

### 1. JSON Validation
```bash
python3 -c "import json; json.load(open('assets/questions/challenge_XX.json'))"
```

### 2. Cross-Duplicate Check
Check all questions across ALL challenge files for duplicates. Use a Python script that:
- Loads all challenge JSONs
- Normalizes question text (lowercase, strip)
- Detects any question appearing in more than one file

### 3. Answer Distribution Check
Target: ~12-13 per option (A-D). Use Python to count per challenge.

### 4. Structural Checks
- Exactly 50 questions per challenge
- IDs 1-50 sequential
- 4 options per question
- correctIndex in [0,1,2,3]
- No empty strings
- Explanations present and meaningful

### 5. Copyright Check
Scan for:
- Book titles ("Reinforcement Learning: An Introduction", etc.)
- Author names (Sutton, Barto, Mnih, Schulman, etc.)
- Page/chapter/figure references with numbers
- Publication names (arXiv, Nature, ICML, NeurIPS)
- Institution names used as sources

### 6. Option Quality Check
- No joke options (bank accounts, magic, unicorns)
- All options relevant to the topic
- No single-word options unless they are valid answers

### 7. Build Verification
```bash
flutter build apk --debug
```
Must complete without errors.

---

## Key Technical Details

### Level 4 Data
- `level4_data.json`: `totalChallenges: 12`
- `all_levels.json`: L4 has `totalChallenges: 12`
- `challenge_data.dart`: `level4` has 12 ChallengeInfo entries (C16-C27)

### Home Screen Counts
- Current: "1350+ questions across 27 challenges"
- Update both the subtitle text AND the feature tile subtitle when adding challenges

### Level Screen Gradient
- Level 4 uses `[AppColors.info, AppColors.secondaryLight]` (cyan + teal)

### Level 4 Icons
- Level selection: `Icons.smart_toy`
- C16: `smart_toy`
- C17: `functions`
- C18: `trending_up`
- C19: `explore`
- C20: `assessment`
- C21: `engineering`
- C22: `track_changes`
- C23: `memory`
- C24: `videogame_asset`
- C25: `speed`
- C26: `trending_flat`
- C27: `rocket_launch`

---

## Future Work / TODO

### Potential Next Steps
1. **Level 5:** Could be created following the same pattern (e.g., Advanced NLP, Computer Vision, MLOps)
2. **Challenge Hints:** Add hint system for difficult questions
3. **Progressive Unlocking:** Currently all challenges are unlocked; could implement sequential unlocking
4. **Dark Mode Polish:** Some screens may need dark mode adjustments
5. **Pre-existing Warnings:** The deprecated `WillPopScope` warnings could be fixed (low priority)

### If Adding New Challenges
Follow the exact same workflow:
1. Create question JSON (50 questions, balanced, no duplicates, no copyright refs)
2. Update `challenge_data.dart`
3. Update `levelN_data.json`
4. Update `all_levels.json`
5. Update UI files (level_screen, level_selection, progress, home, constants)
6. Run full validation (JSON, duplicates, distribution, copyright, build)
7. Commit with descriptive message

---

## Git Workflow

```bash
cd ~/Desktop/Learn\ AI-ML

# After creating/modifying files
git add -A
git status --short  # Verify what's changed

# Commit with descriptive message
git commit -m "Add Cxx-Cyy: Topic description

- Details about what was added/changed
- Any fixes applied
- Build status"

# Push
git push origin main
```

---

## Important Notes for Future Agents

1. **ALWAYS recheck before committing** — run the full validation script
2. **Copyright compliance is non-negotiable** — scan for book/author references
3. **Watch for the trailing comma bug** in `home_screen.dart` edits
4. **Balance answer distributions** after any question replacements
5. **Use `StrReplaceFile` with context** (surrounding lines) to avoid matching wrong instances
6. **The 50-question, 4-option format is fixed** — maintain this structure
7. **Level 4 is COMPLETE** — 12 challenges covering all 24 DRL lessons

---

Last Updated: 2026-04-09
Level 4 Status: COMPLETE (C16-C27, 600 questions)
Total App: 27 challenges, 1,350 questions
