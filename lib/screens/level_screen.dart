import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../models/challenge_data.dart';
import '../models/question.dart';
import '../providers/progress_provider.dart';
import '../utils/constants.dart';
import 'quiz_screen.dart';

class LevelScreen extends StatelessWidget {
  final int levelId;
  
  const LevelScreen({super.key, required this.levelId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressProvider = context.watch<ProgressProvider>();
    
    // Get level data based on levelId
    final levelData = levelId == 1
        ? level1
        : levelId == 2
            ? level2
            : levelId == 3
                ? level3
                : level4;
    final title = levelId == 1
        ? AppStrings.level1Title
        : levelId == 2
            ? AppStrings.level2Title
            : levelId == 3
                ? AppStrings.level3Title
                : AppStrings.level4Title;
    final subtitle = levelId == 1
        ? AppStrings.level1Subtitle
        : levelId == 2
            ? AppStrings.level2Subtitle
            : levelId == 3
                ? AppStrings.level3Subtitle
                : AppStrings.level4Subtitle;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: levelId == 1
                        ? [AppColors.primaryLight, AppColors.secondaryLight]
                        : levelId == 2
                            ? [AppColors.success, AppColors.secondaryLight]
                            : levelId == 3
                                ? [AppColors.warning, AppColors.error]
                                : [AppColors.info, AppColors.secondaryLight],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppStrings.challenges,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final challenge = levelData.challenges[index];
                final progress = progressProvider.getProgressForChallenge(challenge.id);
                final isLocked = false; // All challenges unlocked for testing
                
                return _buildChallengeCard(
                  context,
                  challenge,
                  progress,
                  isLocked,
                  index,
                );
              },
              childCount: levelData.challenges.length,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
        ],
      ),
    );
  }

  Widget _buildChallengeCard(
    BuildContext context,
    ChallengeInfo challenge,
    QuizProgress? progress,
    bool isLocked,
    int index,
  ) {
    final theme = Theme.of(context);
    final color = AppColors.challengeColors[index % AppColors.challengeColors.length];
    final isCompleted = progress?.isCompleted ?? false;
    final hasProgress = progress != null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: isLocked ? 0 : 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: isLocked
              ? null
              : () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(challengeId: challenge.id),
                    ),
                  ),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isLocked ? Colors.grey[100] : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: isLocked 
                        ? Colors.grey[400] 
                        : color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: isLocked
                        ? Icon(Icons.lock, color: Colors.grey[600])
                        : isCompleted
                            ? Icon(Icons.check_circle, color: color, size: 28)
                            : Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challenge.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isLocked ? Colors.grey[500] : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        challenge.subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: isLocked ? Colors.grey[400] : Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (hasProgress && !isCompleted) ...[
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: progress.percentage / 100,
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                          minHeight: 4,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${progress.score}/${progress.totalQuestions} correct',
                          style: TextStyle(
                            fontSize: 12,
                            color: color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      if (isCompleted) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.check_circle, size: 14, color: AppColors.success),
                            const SizedBox(width: 4),
                            Text(
                              '${progress!.percentage.toInt()}% Score',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.success,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                if (!isLocked)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
              ],
            ),
          ),
        ),
      ),
    ).animate(delay: (index * 50).ms).fadeIn(duration: 300.ms).slideX(begin: 0.1);
  }
}
