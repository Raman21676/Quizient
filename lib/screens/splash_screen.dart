import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/constants.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final List<Star> stars;
  late final AnimationController _twinkleController;

  @override
  void initState() {
    super.initState();
    
    // Generate stars across the whole screen (upper + lower areas)
    final random = Random(42); // Fixed seed for consistent pattern
    stars = List.generate(40, (index) {
      // Distribute stars across entire screen (0.0 to 1.0 for both x and y)
      return Star(
        x: random.nextDouble(),
        y: random.nextDouble(), // Full screen distribution including lower half
        size: 2.0 + random.nextDouble() * 4.0, // Size between 2-6
        delay: random.nextDouble() * 2.0, // Random delay for twinkling
        duration: 1.0 + random.nextDouble() * 2.0, // Random duration
      );
    });

    // Twinkle animation controller
    _twinkleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // Navigate to home after delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _twinkleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A2E), // Deep purple-blue
              Color(0xFF16213E), // Navy blue
              Color(0xFF0F3460), // Dark blue (lower part)
            ],
          ),
        ),
        child: Stack(
          children: [
            // Twinkling Stars
            ...stars.map((star) {
              return Positioned(
                left: star.x * size.width,
                top: star.y * size.height,
                child: AnimatedBuilder(
                  animation: _twinkleController,
                  builder: (context, child) {
                    // Create twinkling effect using sine wave
                    final twinkle = sin(
                      (_twinkleController.value * 2 * pi * star.duration) +
                          star.delay,
                    );
                    final opacity = 0.4 + (twinkle + 1) / 2 * 0.6; // Range: 0.4 to 1.0
                    
                    return Container(
                      width: star.size,
                      height: star.size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(opacity),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(opacity * 0.5),
                            blurRadius: star.size,
                            spreadRadius: star.size / 4,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),

            // Moon
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFFDE7),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40FFFDE7),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),
            ),

            // Moon shadow (crescent effect)
            Center(
              child: Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(left: 15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ),

            // App Logo/Icon
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 120), // Push below moon
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF667eea).withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.psychology,
                      size: 60,
                      color: Colors.white,
                    ),
                  )
                      .animate()
                      .scale(duration: 600.ms, curve: Curves.elasticOut)
                      .fadeIn(duration: 400.ms),

                  const SizedBox(height: 24),

                  // App Name
                  Text(
                    AppStrings.appName,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  )
                      .animate(delay: 200.ms)
                      .fadeIn()
                      .slideY(begin: 0.3),

                  const SizedBox(height: 8),

                  // Tagline
                  Text(
                    'Master AI & ML through practice',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  )
                      .animate(delay: 400.ms)
                      .fadeIn()
                      .slideY(begin: 0.3),
                ],
              ),
            ),

            // Loading indicator at bottom
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withOpacity(0.8),
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 800.ms)
                        .scale(delay: 800.ms),
                    const SizedBox(height: 16),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ).animate().fadeIn(delay: 1000.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Star data class
class Star {
  final double x; // 0.0 to 1.0 (horizontal position)
  final double y; // 0.0 to 1.0 (vertical position)
  final double size;
  final double delay;
  final double duration;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.delay,
    required this.duration,
  });
}
