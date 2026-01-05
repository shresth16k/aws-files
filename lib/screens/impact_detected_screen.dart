import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';
import 'package:jeevan/widgets/neon_button.dart';

class ImpactDetectedScreen extends StatefulWidget {
  const ImpactDetectedScreen({super.key});

  @override
  State<ImpactDetectedScreen> createState() => _ImpactDetectedScreenState();
}

class _ImpactDetectedScreenState extends State<ImpactDetectedScreen> {
  int _secondsRemaining = 10;
  Timer? _timer;
  bool _alertSent = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        _sendAlert();
      }
    });
  }

  void _sendAlert() {
    setState(() {
      _alertSent = true;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.alertRed.withOpacity(0.1),
      body: Stack(
        children: [
          // Flashing Red Background
          Positioned.fill(
            child: Container(color: Colors.black)
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .tint(color: AppColors.alertRed.withOpacity(0.3), duration: 500.ms),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.lg, AppSpacing.md, 100),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  // Blinking Header
                  GlassCard(
                    borderColor: AppColors.alertRed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.warning_amber_rounded, color: AppColors.alertRed, size: 32),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          "IMPACT DETECTED",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.alertRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ).animate(onPlay: (c) => c.repeat(reverse: true)).fade(duration: 300.ms),

                  const Spacer(),

                  // Timer or Status
                  if (!_alertSent)
                    Column(
                      children: [
                        const Text(
                          "SOS IN",
                          style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),
                        ),
                        Text(
                          "00:${_secondsRemaining.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            color: AppColors.alertRed,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2',
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        const Icon(Icons.check_circle_outline, color: AppColors.alertRed, size: 80),
                        const SizedBox(height: AppSpacing.md),
                        const Text(
                          "ALERT SENT TO\nEMERGENCY CONTACTS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.alertRed,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const Text(
                          "LOCATION SHARED",
                          style: TextStyle(color: Colors.white70, letterSpacing: 1),
                        ),
                      ],
                    ).animate().fadeIn().scale(),

                  const Spacer(),

                  // Actions
                  Column(
                    children: [
                      NeonButton(
                        text: "I AM SAFE",
                        onPressed: () {
                          _timer?.cancel();
                          // Navigate back or reset
                          context.go('/home');
                        },
                        color: AppColors.neonGreen,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      NeonButton(
                        text: "EMERGENCY CONTACTS",
                        onPressed: () => context.go('/contacts'),
                        color: AppColors.alertRed,
                        isOutline: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
