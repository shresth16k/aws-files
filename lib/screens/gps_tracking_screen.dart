import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';
import 'package:jeevan/widgets/neon_button.dart';

class GpsTrackingScreen extends StatefulWidget {
  const GpsTrackingScreen({super.key});

  @override
  State<GpsTrackingScreen> createState() => _GpsTrackingScreenState();
}

class _GpsTrackingScreenState extends State<GpsTrackingScreen> {
  bool isEngineOn = true;
  
  // Default location (e.g., New Delhi)
  final LatLng _currentLocation = const LatLng(28.6139, 77.2090);

  void _toggleEngine() {
    setState(() {
      isEngineOn = !isEngineOn;
    });

    if (!isEngineOn) {
      // Show Popup
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: GlassCard(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock, color: AppColors.alertRed, size: 48)
                    .animate(onPlay: (c) => c.repeat(reverse: true))
                    .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2)),
                const SizedBox(height: AppSpacing.md),
                const Text(
                  "ENGINE STOPPED",
                  style: TextStyle(
                    color: AppColors.alertRed,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  "VEHICLE IMMOBILIZED",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: AppSpacing.lg),
                NeonButton(
                  text: "DISMISS",
                  onPressed: () => context.pop(),
                  isOutline: true,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black, // Prevent white flash on load
      body: Stack(
        children: [
          // ---------------------------------------------------------
          // 1. LIVE MAP LAYER (Replaces the Image.asset)
          // ---------------------------------------------------------
          FlutterMap(
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 14.5,
              // Disable rotation for a stable view
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
            children: [
              // Dark Theme Tiles (No API Key required)
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'jeevan',
              ),
              
              // Vehicle Marker
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentLocation,
                    width: 60,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.neonCyan.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.neonCyan.withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(
                          color: AppColors.neonCyan,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.navigation_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // ---------------------------------------------------------
          // 2. GRADIENT OVERLAY (For text readability)
          // ---------------------------------------------------------
          Positioned.fill(
            child: IgnorePointer( // Allows touches to pass through to map
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                      Colors.black.withOpacity(0.9),
                    ],
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // ---------------------------------------------------------
          // 3. UI CONTROLS LAYER
          // ---------------------------------------------------------
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.lg, AppSpacing.md, 100),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  // Header
                  GlassCard(
                    child: Center(
                      child: Text(
                        "LIVE GPS TRACKING",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.neonCyan,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Bottom Controls
                  GlassCard(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("CURRENT SPEED", style: TextStyle(color: Colors.white54, fontSize: 10)),
                                Text(
                                  isEngineOn ? "65 KM/H" : "0 KM/H",
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isEngineOn 
                                    ? AppColors.neonGreen.withOpacity(0.2) 
                                    : AppColors.alertRed.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isEngineOn ? AppColors.neonGreen : AppColors.alertRed,
                                ),
                              ),
                              child: Text(
                                isEngineOn ? "ENGINE ON" : "ENGINE OFF",
                                style: TextStyle(
                                  color: isEngineOn ? AppColors.neonGreen : AppColors.alertRed,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        NeonButton(
                          text: isEngineOn ? "STOP ENGINE" : "START ENGINE",
                          onPressed: _toggleEngine,
                          color: isEngineOn ? AppColors.alertRed : AppColors.neonGreen,
                          icon: Icons.power_settings_new,
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