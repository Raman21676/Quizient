import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';
import '../utils/constants.dart';

class FeedbackScreen extends StatefulWidget {
  final bool isCorrect;
  final String question;
  final String correctAnswer;
  final String explanation;
  final VoidCallback onContinue;

  const FeedbackScreen({
    super.key,
    required this.isCorrect,
    required this.question,
    required this.correctAnswer,
    required this.explanation,
    required this.onContinue,
  });

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  ConfettiController? _confettiController;

  @override
  void initState() {
    super.initState();
    if (widget.isCorrect) {
      _confettiController = ConfettiController(duration: const Duration(seconds: 1));
      _confettiController?.play();
    }
  }

  @override
  void dispose() {
    _confettiController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = widget.isCorrect ? AppColors.success : AppColors.error;
    final icon = widget.isCorrect ? Icons.check_circle : Icons.cancel;
    final title = widget.isCorrect ? AppStrings.correct : AppStrings.incorrect;

    return WillPopScope(
      onWillPop: () async {
        widget.onContinue();
        return false;
      },
      child: Scaffold(
        backgroundColor: color.withOpacity(0.05),
        body: SafeArea(
          child: Stack(
            children: [
              if (_confettiController != null)
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _confettiController!,
                    blastDirectionality: BlastDirectionality.explosive,
                    particleDrag: 0.05,
                    emissionFrequency: 0.05,
                    numberOfParticles: 50,
                    gravity: 0.2,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple,
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 32),

                            // Icon
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                icon,
                                size: 80,
                                color: color,
                              ),
                            )
                                .animate()
                                .scale(duration: 400.ms, curve: Curves.elasticOut)
                                .fadeIn(duration: 200.ms),

                            const SizedBox(height: 32),

                            // Title
                            Text(
                              title,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ).animate(delay: 200.ms).fadeIn().slideY(begin: 0.3),

                            const SizedBox(height: 32),

                            // Explanation Card
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Question (shown for both correct and incorrect)
                                    Text(
                                      'Question:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      widget.question,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Divider(height: 32),
                                    Text(
                                      'Correct Answer:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.success,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      widget.correctAnswer,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Divider(height: 32),
                                    Text(
                                      AppStrings.explanation,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      widget.explanation,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: theme.colorScheme.onSurface.withOpacity(0.8),
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animate(delay: 400.ms).fadeIn().slideY(begin: 0.2),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),

                    // Continue Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: widget.onContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ).animate(delay: 600.ms).fadeIn().slideY(begin: 0.3),

                    const SizedBox(height: 8),

                    // Tap hint
                    Text(
                      AppStrings.tapToContinue,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
