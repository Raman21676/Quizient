import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/challenge_data.dart';
import '../models/question.dart';
import '../providers/progress_provider.dart';
import '../utils/constants.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressProvider = context.watch<ProgressProvider>();
    final overallProgress = progressProvider.getOverallProgress();
    final completedCount = progressProvider.completedChallengesCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.viewProgress),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Progress Card
            _buildOverallProgressCard(context, overallProgress, completedCount),
            const SizedBox(height: 24),

            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    icon: Icons.emoji_events,
                    value: '$completedCount',
                    label: 'Completed',
                    color: AppColors.success,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    icon: Icons.local_fire_department,
                    value: '${progressProvider.dailyStreak}',
                    label: 'Day Streak',
                    color: AppColors.warning,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    icon: Icons.star,
                    value: '${overallProgress.toInt()}%',
                    label: 'Progress',
                    color: AppColors.info,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Challenge Progress List
            Text(
              'Challenge Progress',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            ...level1.challenges.map((challenge) {
              final progress = progressProvider.getProgressForChallenge(challenge.id);
              return _buildChallengeProgressTile(context, challenge, progress);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildOverallProgressCard(
    BuildContext context,
    double progress,
    int completed,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryLight.withOpacity(0.8),
              AppColors.secondaryLight.withOpacity(0.8),
            ],
          ),
        ),
        child: Column(
          children: [
            const Text(
              AppStrings.overallProgress,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: progress / 100,
                    strokeWidth: 12,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                Text(
                  '${progress.toInt()}%',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '$completed of ${level1.challenges.length} ${AppStrings.challengesCompleted}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChallengeProgressTile(
    BuildContext context,
    challenge,
    QuizProgress? progress,
  ) {
    final theme = Theme.of(context);
    final index = level1.challenges.indexOf(challenge);
    final color = AppColors.challengeColors[index % AppColors.challengeColors.length];
    final hasProgress = progress != null;
    final percentage = hasProgress ? progress.percentage : 0.0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challenge.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        challenge.subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (hasProgress && progress.isCompleted)
                  Icon(Icons.check_circle, color: AppColors.success)
                else if (hasProgress)
                  Text(
                    '${percentage.toInt()}%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  )
                else
                  Icon(Icons.lock_outline, color: Colors.grey[400]),
              ],
            ),
            if (hasProgress) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: percentage / 100,
                  minHeight: 6,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              if (progress.isCompleted) ...[
                const SizedBox(height: 8),
                Text(
                  'Completed on ${_formatDate(progress.completedAt)}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
