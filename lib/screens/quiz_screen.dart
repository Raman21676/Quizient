import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/progress_provider.dart';
import '../utils/constants.dart';
import 'feedback_screen.dart';
import 'results_screen.dart';

class QuizScreen extends StatefulWidget {
  final String challengeId;

  const QuizScreen({super.key, required this.challengeId});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  Future<void> _loadQuiz() async {
    try {
      await context.read<QuizProvider>().startQuiz(widget.challengeId);
      if (mounted) {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading questions...'),
            ],
          ),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $_error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    final quizProvider = context.watch<QuizProvider>();
    final theme = Theme.of(context);

    if (!quizProvider.isQuizActive || quizProvider.questions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = quizProvider.currentQuestion;
    if (currentQuestion == null) {
      return const Scaffold(
        body: Center(child: Text('Error loading question')),
      );
    }

    return WillPopScope(
      onWillPop: () async => await _showQuitDialog(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${AppStrings.question} ${quizProvider.currentQuestionNumber}/${quizProvider.totalQuestions}',
          ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              if (await _showQuitDialog(context)) {
                if (mounted) Navigator.pop(context);
              }
            },
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle, color: AppColors.success, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${quizProvider.correctAttemptsCount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Progress Indicator
            LinearProgressIndicator(
              value: quizProvider.progressPercentage,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
              minHeight: 6,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Card
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            // Question Number Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${AppStrings.question.toUpperCase()} ${quizProvider.currentQuestionNumber}',
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Question Text
                            Text(
                              currentQuestion.questionText,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2, duration: 500.ms),

                    const SizedBox(height: 32),

                    // Options
                    ...List.generate(currentQuestion.options.length, (index) {
                      final labels = ['A', 'B', 'C', 'D'];
                      final label = labels[index];
                      final optionText = currentQuestion.options[index];

                      return _buildOptionButton(
                        context,
                        label: label,
                        text: optionText,
                        index: index,
                        isSelected: quizProvider.selectedAnswerIndex == index,
                        onTap: () => _selectAnswer(context, index),
                      ).animate(delay: (100 * index).ms).fadeIn(duration: 400.ms).slideX(begin: -0.3, duration: 500.ms);
                    }),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectAnswer(BuildContext context, int answerIndex) {
    final quizProvider = context.read<QuizProvider>();

    if (quizProvider.hasAnswered) return;

    HapticFeedback.lightImpact();
    quizProvider.selectAnswer(answerIndex);

    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FeedbackScreen(
            isCorrect: quizProvider.isCorrect,
            question: quizProvider.currentQuestion!.questionText,
            correctAnswer: quizProvider.currentQuestion!.correctAnswer,
            explanation: quizProvider.currentQuestion!.explanation,
            onContinue: () {
              Navigator.pop(context);
              
              if (quizProvider.isLastQuestion) {
                // Save progress and show results
                _saveProgressAndShowResults();
              } else {
                quizProvider.moveToNextQuestion();
              }
            },
          ),
        ),
      );
    });
  }

  Future<void> _saveProgressAndShowResults() async {
    final quizProvider = context.read<QuizProvider>();
    final progressProvider = context.read<ProgressProvider>();

    await progressProvider.saveQuizProgress(
      widget.challengeId,
      quizProvider.score,
      quizProvider.totalQuestions,
    );

    if (quizProvider.wrongAnswers.isNotEmpty) {
      await progressProvider.addWrongAnswers(quizProvider.wrongAnswers);
    }

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultsScreen(
            challengeId: widget.challengeId,
            score: quizProvider.score,
            totalQuestions: quizProvider.totalQuestions,
          ),
        ),
      );
    }
  }

  Widget _buildOptionButton(
    BuildContext context, {
    required String label,
    required String text,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final quizProvider = context.watch<QuizProvider>();

    Color backgroundColor = theme.cardColor;
    Color borderColor = Colors.grey.withOpacity(0.3);
    Color textColor = theme.colorScheme.onSurface;

    if (isSelected) {
      backgroundColor = theme.colorScheme.primary.withOpacity(0.1);
      borderColor = theme.colorScheme.primary;
      textColor = theme.colorScheme.primary;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: quizProvider.hasAnswered ? null : onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: borderColor,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? borderColor.withOpacity(0.2)
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: isSelected ? textColor : Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      color: textColor,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showQuitDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Quit Quiz?'),
            content: const Text(AppStrings.quitWarning),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(AppStrings.cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<QuizProvider>().quitQuiz();
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text(AppStrings.quit),
              ),
            ],
          ),
        ) ??
        false;
  }
}
