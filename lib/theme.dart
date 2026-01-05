import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Brand Colors
  static const obsidianBlack = Color(0xFF050505);
  static const neonCyan = Color(0xFF00F2FF);
  static const electricBlue = Color(0xFF2E59FF);
  static const alertRed = Color(0xFFFF3131);
  static const neonGreen = Color(0xFF2DFF57);
  
  // Functional Colors
  static const darkSurface = Color(0xFF0F0F0F);
  static const glassBorder = Color(0x33FFFFFF);
  static const glassBackground = Color(0x1AFFFFFF);
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

class AppRadius {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
}

ThemeData get appTheme => ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.obsidianBlack,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.neonCyan,
    onPrimary: Colors.black,
    secondary: AppColors.electricBlue,
    onSecondary: Colors.white,
    error: AppColors.alertRed,
    onError: Colors.white,
    surface: AppColors.obsidianBlack,
    onSurface: Colors.white,
    background: AppColors.obsidianBlack,
    onBackground: Colors.white,
  ),
  textTheme: _buildTextTheme(),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
  ),
);

TextTheme _buildTextTheme() {
  // Using Exo 2 for that automotive/futuristic look
  return TextTheme(
    displayLarge: GoogleFonts.exo2(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.exo2(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.exo2(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.exo2(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.exo2(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.exo2(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.exo2(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.exo2(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSmall: GoogleFonts.exo2(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.exo2(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.exo2(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white70,
    ),
    labelLarge: GoogleFonts.exo2(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
