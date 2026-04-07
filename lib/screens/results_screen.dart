import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';
import '../models/challenge_data.dart';
import '../utils/constants.dart';
import 'home_screen.dart';
import 'level_screen.dart';
import 'quiz_screen.dart';

class ResultsScreen extends StatefulWidget {
  final String challengeId;
  final int score;
  final int totalQuestions;

  const ResultsScreen({
    super.key,
    required this.challengeId,
    required this.score,
    required this.totalQuestions,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    
    // Play confetti if score is good (above 70%)
    if (widget.score / widget.totalQuestions >= 0.7) {
      _confettiController.play();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = (widget.score / widget.totalQuestions) * 100;
    final isPassed = percentage >= 70;

    String message;
    Color resultColor;
    IconData resultIcon;

    if (percentage >= 90) {
      message = 'Excellent! 🎉';
      resultColor = AppColors.success;
      resultIcon = Icons.emoji_events;
    } else if (percentage >= 70) {
      message = 'Great job! 👏';
      resultColor = AppColors.info;
      resultIcon = Icons.thumb_up;
    } else if (percentage >= 50) {
      message = 'Good effort! 💪';
      resultColor = AppColors.warning;
      resultIcon = Icons.trending_up;
    } else {
      message = 'Keep practicing! 📚';
      resultColor = AppColors.error;
      resultIcon = Icons.refresh;
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Confetti
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                particleDrag: 0.05,
                emissionFrequency: 0.02,
                numberOfParticles: 30,
                gravity: 0.3,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                  Colors.yellow,
                ],
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 32),

                    // Result Icon
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: resultColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        resultIcon,
                        size: 80,
                        color: resultColor,
                      ),
                    )
                        .animate()
                        .scale(duration: 500.ms, curve: Curves.elasticOut)
                        .fadeIn(),

                    const SizedBox(height: 32),

                    // Title
                    Text(
                      AppStrings.quizComplete,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate(delay: 200.ms).fadeIn().slideY(begin: 0.3),

                    const SizedBox(height: 8),

                    // Message
                    Text(
                      message,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: resultColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ).animate(delay: 300.ms).fadeIn(),

                    const SizedBox(height: 32),

                    // Score Card
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            Text(
                              AppStrings.yourScore,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${percentage.toInt()}%',
                              style: TextStyle(
                                fontSize: 56,
                                fontWeight: FontWeight.bold,
                                color: resultColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: resultColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${widget.score}/${widget.totalQuestions} ${AppStrings.questionsCorrect}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: resultColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate(delay: 400.ms).fadeIn().slideY(begin: 0.2),

                    const Spacer(),

                    // Action Buttons
                    if (!isPassed)
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => QuizScreen(
                                  challengeId: widget.challengeId,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text(
                            AppStrings.retry,
                            style: TextStyle(fontSize: 16),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ).animate(delay: 600.ms).fadeIn(),

                    if (!isPassed) const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        icon: const Icon(Icons.home),
                        label: const Text(
                          AppStrings.backToHome,
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryLight,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ).animate(delay: 700.ms).fadeIn(),

                    const SizedBox(height: 12),

                    TextButton.icon(
                      onPressed: () {
                        // Calculate level ID from challenge ID
                        final challengeNum = int.tryParse(widget.challengeId.substring(1)) ?? 1;
                        final levelId = challengeNum <= 4 ? 1 : 2;
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LevelScreen(levelId: levelId),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.list),
                      label: const Text('View All Challenges'),
                    ).animate(delay: 800.ms).fadeIn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
