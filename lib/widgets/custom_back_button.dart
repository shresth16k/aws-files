import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Logic:
    // 1. If we can pop, show button.
    // 2. If we are NOT on home and can't pop, show button (to go Home).
    // 3. If we are on Home and can't pop, user implies Screen 2 (Home) MUST have back button.
    //    If we came from Setup via push, canPop is true.
    //    If we came from Setup via go, canPop is false.
    //    I will assume we used push.
    
    final location = GoRouterState.of(context).uri.path;
    final bool isHome = location == '/home';
    final bool canPop = context.canPop();
    
    // If we are on Home and can't pop, maybe hide it? 
    // "Back arrow must be present on every screen except Screen 1".
    // Screen 1 is Setup. Screen 2 is Home.
    // If we can't pop from Home, where do we go?
    // I will show it only if canPop OR if !isHome.
    if (!canPop && isHome) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.md, top: AppSpacing.md),
      child: GlassCard(
        width: 44,
        height: 44,
        padding: EdgeInsets.zero,
        onTap: () {
          if (canPop) {
            context.pop();
          } else {
            context.go('/home');
          }
        },
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.neonCyan,
            size: 20,
          ),
        ),
      ),
    );
  }
}
