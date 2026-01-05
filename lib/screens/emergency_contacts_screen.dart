import 'package:flutter/material.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';
import 'package:jeevan/widgets/neon_button.dart';
import 'package:jeevan/widgets/call_flow.dart';
import 'package:provider/provider.dart';
import 'package:jeevan/models/app_state.dart';
import 'package:jeevan/nav.dart';
import 'package:go_router/go_router.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

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
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  GlassCard(
                    child: Center(
                      child: Text(
                        "EMERGENCY CONTACTS",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.alertRed,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  // Render contacts from AppState to enable dynamic add
                  Consumer<AppState>(
                    builder: (context, state, _) {
                      final items = state.contacts;
                      return Column(
                        children: [
                          for (int i = 0; i < items.length; i++) ...[
                            _buildContactCard(
                              context,
                              items[i].name,
                              items[i].phone,
                              items[i].isSystem ? Icons.local_police : Icons.person,
                              isSystem: items[i].isSystem,
                            ),
                            if (i != items.length - 1) const SizedBox(height: AppSpacing.md),
                          ],
                          const SizedBox(height: AppSpacing.xl),
                        ],
                      );
                    },
                  ),
                  
                  NeonButton(
                    text: "+ ADD NEW CONTACT",
                    onPressed: () async {
                      final added = await context.push(AppRoutes.addContact);
                      if (added == true && context.mounted) {
                        showDialog(
                          context: context,
                          builder: (ctx) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: GlassCard(
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.check_circle_outline, color: AppColors.neonGreen, size: 56),
                                  const SizedBox(height: AppSpacing.md),
                                  const Text('CONTACT ADDED SUCCESSFULLY', style: TextStyle(color: Colors.white)),
                                  const SizedBox(height: AppSpacing.lg),
                                  NeonButton(text: 'OK', onPressed: () => Navigator.of(ctx).pop(), isOutline: true, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    color: AppColors.neonCyan,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, String name, String number, IconData icon, {bool isSystem = false}) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSystem ? AppColors.alertRed.withOpacity(0.1) : AppColors.neonCyan.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: isSystem ? AppColors.alertRed : AppColors.neonCyan,
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: isSystem ? AppColors.alertRed : AppColors.neonCyan,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  number,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          NeonButton(
            text: "CALL",
            onPressed: () => showCallFlow(context, name: name, phone: number),
            isFullWidth: false,
            color: isSystem ? AppColors.alertRed : AppColors.neonCyan,
            isOutline: true,
          ),
        ],
      ),
    );
  }
}
