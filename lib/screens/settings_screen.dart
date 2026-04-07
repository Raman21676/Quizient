import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Appearance Section
          Text(
            'Appearance',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: const Text('Enable dark theme for comfortable viewing'),
              secondary: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: theme.colorScheme.primary,
              ),
              value: isDark,
              onChanged: (_) => context.read<ThemeProvider>().toggleTheme(),
            ),
          ),
          const SizedBox(height: 24),

          // About Section
          Text(
            'About',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.info, color: theme.colorScheme.primary),
                  title: const Text('App Name'),
                  subtitle: const Text(AppStrings.appName),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.code, color: theme.colorScheme.primary),
                  title: const Text('Version'),
                  subtitle: const Text('1.0.0'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.quiz, color: theme.colorScheme.primary),
                  title: const Text('Total Questions'),
                  subtitle: const Text('200 questions across 4 challenges'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Features Section
          Text(
            'Features',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.offline_bolt, color: Colors.green),
                  title: const Text('Offline Learning'),
                  subtitle: const Text('No internet required'),
                  trailing: const Icon(Icons.check_circle, color: Colors.green),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.psychology, color: Colors.blue),
                  title: const Text('Comprehensive Coverage'),
                  subtitle: const Text('AI-ML fundamentals'),
                  trailing: const Icon(Icons.check_circle, color: Colors.green),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.track_changes, color: Colors.orange),
                  title: const Text('Progress Tracking'),
                  subtitle: const Text('Monitor your learning journey'),
                  trailing: const Icon(Icons.check_circle, color: Colors.green),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Footer
          Center(
            child: Text(
              'Built with Flutter',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
