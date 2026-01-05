import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// Ensure these imports match your project structure
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';
import 'package:jeevan/widgets/neon_button.dart';
import 'package:jeevan/models/app_state.dart';

class VehicleSetupScreen extends StatefulWidget {
  const VehicleSetupScreen({super.key});

  @override
  State<VehicleSetupScreen> createState() => _VehicleSetupScreenState();
}

class _VehicleSetupScreenState extends State<VehicleSetupScreen> with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _vehicleController = TextEditingController();
  
  // Animation Controller for the Scanner and Levitation
  late final AnimationController _scanController;
  
  bool _isSyncing = false;
  double _rotX = 0;
  double _rotY = 0;
  double _rotZ = 0;
  Offset? _lastDragPos;

  @override
  void initState() {
    super.initState();
    // Loops every 3 seconds for the scanning effect
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _scanController.dispose();
    _nameController.dispose();
    _vehicleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // Prevent keyboard from distorting the layout
      resizeToAvoidBottomInset: false, 
      body: Stack(
        children: [
          // -----------------------------------------------------------
          // 1. Background Glow (Ambient Light)
          // -----------------------------------------------------------
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.neonCyan.withOpacity(0.1),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.neonCyan.withOpacity(0.5),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    "SETUP VEHICLE",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.neonCyan,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ).animate().fadeIn().slideX(),
                  
                  const SizedBox(height: AppSpacing.xxl),
                  
                  // -----------------------------------------------------------
                  // 2. 3D Car with Holographic Scanner & Levitation
                  // -----------------------------------------------------------
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: GestureDetector(
                        onPanStart: (d) => _lastDragPos = d.localPosition,
                        onPanUpdate: (d) {
                          final delta = d.localPosition - (_lastDragPos ?? d.localPosition);
                          _lastDragPos = d.localPosition;
                          setState(() {
                            _rotY += delta.dx * 0.01; // left/right
                            _rotX -= delta.dy * 0.01; // up/down
                            _rotZ += (delta.dx + delta.dy) * 0.002; // subtle twist
                          });
                        },
                        onPanEnd: (_) => _lastDragPos = null,
                        child: AnimatedBuilder(
                          animation: _scanController,
                          builder: (context, child) {
                            return TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: _rotZ),
                              duration: 300.ms,
                              builder: (context, rotZValue, child) {
                                // Manual 3D Rotation Matrix
                                final matrix = Matrix4.identity()
                                  ..setEntry(3, 2, 0.0015)
                                  ..rotateX(_rotX)
                                  ..rotateY(_rotY)
                                  ..rotateZ(rotZValue);

                                return Transform(
                                  alignment: Alignment.center,
                                  transform: matrix,
                                  child: Transform.translate(
                                    // Levitation Effect (Floating up and down)
                                    offset: Offset(0, math.sin(_scanController.value * 2 * math.pi) * 10),
                                    child: _buildHolographicScanner(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.neonCyan.withOpacity(0.15), 
                                              blurRadius: 30, 
                                              spreadRadius: 10
                                            ),
                                          ],
                                        ),
                                        // THE CAR IMAGE
                                        child: Container(
                                          width: 200,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: AppColors.electricBlue.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            Icons.directions_car,
                                            size: 60,
                                            color: AppColors.neonCyan,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // -----------------------------------------------------------
                  // 3. Input Fields & Buttons
                  // -----------------------------------------------------------
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          _buildInputField("ENTER YOUR NAME", _nameController),
                          const SizedBox(height: AppSpacing.md),
                          _buildInputField("VEHICLE NUMBER", _vehicleController),
                          const SizedBox(height: AppSpacing.xl),
                          NeonButton(
                            text: "SYNC HARDWARE",
                            isLoading: _isSyncing,
                            onPressed: _handleSync,
                          ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
                        ],
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

  // -----------------------------------------------------------
  // Helper: Creates the Laser Scanning Effect
  // -----------------------------------------------------------
  Widget _buildHolographicScanner({required Widget child}) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColors.neonCyan.withOpacity(0.1), // Faint trail
            AppColors.neonCyan.withOpacity(0.8), // Bright Beam
            AppColors.neonCyan.withOpacity(0.1), // Faint trail
            Colors.transparent,
          ],
          // The stops move based on the controller value to create movement
          stops: [
            0.0,
            _scanController.value - 0.2,
            _scanController.value,
            _scanController.value + 0.2,
            1.0,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop, // Overlays the scanner on top of the image
      child: child,
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white, fontFamily: 'Exo 2'),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2);
  }

  // -----------------------------------------------------------
  // Logic: Handle Sync Button Press
  // -----------------------------------------------------------
  Future<void> _handleSync() async {
    final name = _nameController.text.trim();
    final vehicle = _vehicleController.text.trim();
    
    if (name.isEmpty || vehicle.isEmpty) {
      _showErrorDialog();
      return;
    }

    setState(() => _isSyncing = true);
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;
    context.read<AppState>().updateProfile(userName: name, vehicleNumber: vehicle);
    
    await _showSuccessDialog();
    
    if (!mounted) return;
    setState(() => _isSyncing = false);
    context.go('/home');
  }

  Future<void> _showErrorDialog() {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: GlassCard(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: AppColors.alertRed, size: 56),
              const SizedBox(height: AppSpacing.md),
              const Text('ENTER DETAILS', style: TextStyle(color: Colors.white)),
              const SizedBox(height: AppSpacing.sm),
              const Text('Please fill your Name and Vehicle Number', 
                style: TextStyle(color: Colors.white70), textAlign: TextAlign.center),
              const SizedBox(height: AppSpacing.lg),
              NeonButton(text: 'OK', onPressed: () => Navigator.of(ctx).pop(), isOutline: true, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSuccessDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: GlassCard(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline, color: AppColors.neonGreen, size: 56)
                  .animate().scale(duration: 400.ms, curve: Curves.elasticOut),
              const SizedBox(height: AppSpacing.md),
              const Text('DETAILS SAVED', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('SYNC COMPLETE', style: TextStyle(color: Colors.white70)),
              const SizedBox(height: AppSpacing.lg),
              NeonButton(text: 'CONTINUE', onPressed: () => Navigator.of(ctx).pop()),
            ],
          ),
        ),
      ),
    );
  }
}