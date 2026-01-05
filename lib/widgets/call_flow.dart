import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';
import 'package:jeevan/widgets/neon_button.dart';

Future<void> showCallFlow(BuildContext context, {required String name, required String phone}) async {
  // Step 1 – Immediate Popup
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => Dialog(
      backgroundColor: Colors.transparent,
      child: GlassCard(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.call_outlined, color: AppColors.neonCyan, size: 56),
            const SizedBox(height: AppSpacing.md),
            const Text('CALL REQUEST SENT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 4),
            const Text('CONNECTING…', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: AppSpacing.lg),
            NeonButton(text: 'CANCEL', onPressed: () => Navigator.of(ctx).pop(), isOutline: true, color: Colors.white),
          ],
        ),
      ),
    ),
  );

  // Short delay to simulate transition
  await Future<void>.delayed(const Duration(milliseconds: 350));

  // Step 2 – Mock Phone Call UI
  if (!context.mounted) return;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.lg, AppSpacing.md, AppSpacing.lg),
      child: GlassCard(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.phone_in_talk, color: AppColors.neonCyan, size: 56),
            const SizedBox(height: AppSpacing.sm),
            const Text('Calling…', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 4),
            Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(phone, style: const TextStyle(color: Colors.white54)),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeonButton(
                  text: 'END CALL',
                  onPressed: () => Navigator.of(ctx).pop(),
                  color: AppColors.alertRed,
                  icon: Icons.call_end,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
