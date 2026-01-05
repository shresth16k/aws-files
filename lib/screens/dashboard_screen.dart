import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';
import 'package:provider/provider.dart';
import 'package:jeevan/models/app_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Background Gradient
          Positioned(
            top: -200,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.electricBlue.withOpacity(0.15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.electricBlue.withOpacity(0.5),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.lg, AppSpacing.md, 100),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  // Header
                  GlassCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "JEEVAN ACTIVE",
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColors.neonCyan,
                                letterSpacing: 1.5,
                              ),
                            ).animate(onPlay: (c) => c.repeat(reverse: true))
                             .tint(color: Colors.white.withOpacity(0.5), duration: 2.seconds),
                            const SizedBox(height: 4),
                            // Profile summary synced
                            const _DashboardProfileLine(),
                          ],
                        ),
                        const Icon(Icons.shield, color: AppColors.neonCyan),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Hero Section - Car with Shield
                  SizedBox(
                    height: 250,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Shield Effect
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.electricBlue.withOpacity(0.5),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.electricBlue.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                        ).animate(onPlay: (c) => c.repeat()).rotate(duration: 10.seconds),
                        
                        Container(
                          width: 240,
                          height: 240,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.electricBlue.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                        ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 2.seconds),

                        // Car Image
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: AppColors.electricBlue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.directions_car,
                            size: 80,
                            color: AppColors.neonCyan,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Status Cards Grid
                  Row(
                    children: [
                      Expanded(
                        child: GlassCard(
                          height: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("LIVE TRACKING", style: TextStyle(color: Colors.white70, fontSize: 10)),
                                  Icon(Icons.gps_fixed, color: AppColors.neonCyan, size: 16),
                                ],
                              ),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 80,
                                  width: double.infinity,
                                  color: AppColors.electricBlue.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.map,
                                    color: AppColors.neonCyan,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          children: [
                            GlassCard(
                              height: 72,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.electricBlue.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.security, color: AppColors.electricBlue, size: 20),
                                  ),
                                  const SizedBox(width: 8),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("STATUS", style: TextStyle(fontSize: 10, color: Colors.white54)),
                                      Text("ARMED", style: TextStyle(color: AppColors.electricBlue, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                            GlassCard(
                              height: 72,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.neonGreen.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.speed, color: AppColors.neonGreen, size: 20),
                                  ),
                                  const SizedBox(width: 8),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("SPEED", style: TextStyle(fontSize: 10, color: Colors.white54)),
                                      Text("82 KM/H", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: AppSpacing.md),
                  
                  GlassCard(
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: AppColors.neonCyan),
                        const SizedBox(width: AppSpacing.md),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("LAST LOCATION", style: TextStyle(fontSize: 10, color: Colors.white54)),
                            Text("Civil Lines, Prayagraj", style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
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
}

class _DashboardProfileLine extends StatelessWidget {
  const _DashboardProfileLine();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, _) => Text(
        '${state.userName} • ${state.vehicleNumber}',
        style: const TextStyle(color: Colors.white70, fontSize: 12),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
