import 'package:flutter/material.dart';
import 'package:jeevan/theme.dart';

class NeonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final bool isOutline;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;

  const NeonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.isOutline = false,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = color ?? theme.colorScheme.primary;

    final buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                isOutline ? baseColor : Colors.black,
              ),
            ),
          )
        else ...[
          if (icon != null) ...[
            Icon(
              icon,
              color: isOutline ? baseColor : Colors.black,
              size: 20,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text.toUpperCase(),
            style: theme.textTheme.labelLarge?.copyWith(
              color: isOutline ? baseColor : Colors.black,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );

    final buttonStyle = BoxDecoration(
      color: isOutline ? Colors.transparent : baseColor,
      borderRadius: BorderRadius.circular(AppRadius.md),
      border: Border.all(
        color: baseColor,
        width: 1.5,
      ),
      boxShadow: isOutline
          ? null
          : [
              BoxShadow(
                color: baseColor.withOpacity(0.4),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
    );

    Widget button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Container(
          decoration: buttonStyle,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
            horizontal: AppSpacing.lg,
          ),
          alignment: Alignment.center,
          child: buttonContent,
        ),
      ),
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
