import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/challenge_data.dart';
import '../providers/progress_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/constants.dart';
import 'level_screen.dart';
import 'package:provider/provider.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Select Level',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryLight,
                      AppColors.secondaryLight,
                    ],
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
                    'Choose your learning path',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Level 1 Card
                  _buildLevelCard(
                    context,
                    level: level1,
                    levelId: 1,
                    isDark: isDark,
                    icon: Icons.psychology,
                    gradientColors: [AppColors.primaryLight, AppColors.secondaryLight],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LevelScreen(levelId: 1),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Level 2 Card
                  _buildLevelCard(
                    context,
                    level: level2,
                    levelId: 2,
                    isDark: isDark,
                    icon: Icons.school,
                    gradientColors: [AppColors.success, AppColors.secondaryLight],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LevelScreen(levelId: 2),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Level 3 Card
                  _buildLevelCard(
                    context,
                    level: level3,
                    levelId: 3,
                    isDark: isDark,
                    icon: Icons.code,
                    gradientColors: [AppColors.warning, AppColors.error],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LevelScreen(levelId: 3),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Level 4 Card
                  _buildLevelCard(
                    context,
                    level: level4,
                    levelId: 4,
                    isDark: isDark,
                    icon: Icons.smart_toy,
                    gradientColors: [AppColors.info, AppColors.secondaryLight],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LevelScreen(levelId: 4),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Level 5 Card
                  _buildLevelCard(
                    context,
                    level: level5,
                    levelId: 5,
                    isDark: isDark,
                    icon: Icons.chat,
                    gradientColors: [Color(0xFFE91E63), Color(0xFFFF5722)],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LevelScreen(levelId: 5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard(
    BuildContext context, {
    required Level level,
    required int levelId,
    required bool isDark,
    required IconData icon,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final progressProvider = context.watch<ProgressProvider>();
    final completedCount = progressProvider.completedChallengesCount;
    final progress = progressProvider.getOverallProgress();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                gradientColors[0].withOpacity(0.1),
                gradientColors[1].withOpacity(0.1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: gradientColors[0].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      icon,
                      color: gradientColors[0],
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          level.name,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${level.challenges.length} Challenges',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: gradientColors[0],
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 12),
              Text(
                level.description,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(gradientColors[0]),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 8),
              Text(
                '$completedCount of ${level.challenges.length} completed (${progress.toInt()}%)',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2, duration: 500.ms);
  }

  Widget _buildComingSoonCard(
    BuildContext context, {
    required String levelName,
    required String description,
    required bool isDark,
  }) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.lock_clock,
                color: Colors.grey[400],
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    levelName,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'SOON',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate(delay: 200.ms).fadeIn(duration: 400.ms);
  }
}
