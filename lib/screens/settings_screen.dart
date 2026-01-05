import 'package:flutter/material.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';
import 'package:jeevan/widgets/neon_button.dart';
import 'package:provider/provider.dart';
import 'package:jeevan/models/app_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _aiSensitivity = 0.7;
  double _impactSensitivity = 0.5;
  bool _autoAlert = true;
  bool _pushNotifications = true;

  void _openEditDetailsSheet(BuildContext context) {
    final state = context.read<AppState>();
    final nameController = TextEditingController(text: state.userName);
    final vehicleController = TextEditingController(text: state.vehicleNumber);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.md,
          right: AppSpacing.md,
          top: AppSpacing.lg,
          // CHANGED: Added padding.bottom + 120px to shift the screen up significantly
          bottom: MediaQuery.of(ctx).viewInsets.bottom + MediaQuery.of(ctx).padding.bottom + 120,
        ),
        // CHANGED: Wrapped in SingleChildScrollView to handle overflow when shifted up
        child: SingleChildScrollView(
          child: GlassCard(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.edit, color: AppColors.neonCyan),
                    const SizedBox(width: AppSpacing.md),
                    Text('EDIT DETAILS', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.neonCyan)),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                _buildEditField('NAME', nameController, Icons.badge),
                const SizedBox(height: AppSpacing.md),
                _buildEditField('VEHICLE NUMBER', vehicleController, Icons.directions_car),
                const SizedBox(height: AppSpacing.xl),
                NeonButton(
                  text: 'SAVE',
                  onPressed: () {
                    state.updateProfile(userName: nameController.text.trim(), vehicleNumber: vehicleController.text.trim());
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditField(String label, TextEditingController controller, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.neonCyan),
          ),
          child: Icon(icon, color: AppColors.neonCyan, size: 20),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.lg, AppSpacing.md, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  Center(
                    child: Text(
                      "SYSTEM SETTINGS",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.neonCyan,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // Profile Section
                  GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PROFILE",
                          style: TextStyle(
                            color: AppColors.electricBlue,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Consumer<AppState>(
                          builder: (context, state, _) => Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[800],
                                  border: Border.all(color: AppColors.neonCyan),
                                ),
                                child: const Icon(Icons.person, color: Colors.white, size: 30),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Column(
                                  children: [
                                    _buildCompactField("Name", state.userName),
                                    const SizedBox(height: 8),
                                    _buildCompactField("Vehicle", state.vehicleNumber),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _buildCompactField("Phone", "+91 98765 43210"),
                        const SizedBox(height: 8),
                        _buildCompactField("Email", "arjun.r@example.com"),
                        const SizedBox(height: AppSpacing.md),
                        Row(
                          children: [
                            Expanded(
                              child: NeonButton(
                                text: "EDIT DETAILS",
                                onPressed: () => _openEditDetailsSheet(context),
                                isFullWidth: true,
                                isOutline: true,
                                color: AppColors.neonCyan,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Settings Section
                  GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "SENSITIVITY",
                          style: TextStyle(
                            color: AppColors.electricBlue,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _buildSlider("AI Sensor Sensitivity", _aiSensitivity, (v) => setState(() => _aiSensitivity = v)),
                        const SizedBox(height: AppSpacing.md),
                        _buildSlider("Impact Detection", _impactSensitivity, (v) => setState(() => _impactSensitivity = v)),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                          child: Divider(color: Colors.white10),
                        ),
                        
                        _buildToggle("Auto Emergency Alert", _autoAlert, (v) => setState(() => _autoAlert = v)),
                        _buildToggle("Push Notifications", _pushNotifications, (v) => setState(() => _pushNotifications = v)),
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

  Widget _buildCompactField(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.white)),
            Text("${(value * 100).toInt()}%", style: const TextStyle(color: AppColors.neonCyan)),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.neonCyan,
            inactiveTrackColor: Colors.white10,
            thumbColor: Colors.white,
            overlayColor: AppColors.neonCyan.withOpacity(0.2),
          ),
          child: Slider(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildToggle(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.neonCyan,
            activeTrackColor: AppColors.neonCyan.withOpacity(0.3),
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.white10,
          ),
        ],
      ),
    );
  }
}