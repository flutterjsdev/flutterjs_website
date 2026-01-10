import 'package:flutter/material.dart';

/// FlutterJS brand colors inspired by Flutter's website
class AppColors {
  // Primary colors - Modern vibrant blue theme
  static const Color primaryBlue = Color(0xFF0066FF);
  static const Color primaryDarkBlue = Color(0xFF0052CC);
  static const Color primaryLightBlue = Color(0xFF3399FF);
  
  // Secondary colors - More vibrant
  static const Color secondaryTeal = Color(0xFF00E5CC);
  static const Color accentCyan = Color(0xFF00F0FF);
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color accentPink = Color(0xFFEC4899);
  
  // Background colors
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundLightGray = Color(0xFFFAFBFC);
  static const Color backgroundDarkGray = Color(0xFF1A1A1A);
  
  // Text colors - Better contrast
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textLight = Color(0xFFFFFFFF);
  
  // Border and divider colors
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color dividerColor = Color(0xFFCBD5E1);
  
  // Status colors
  static const Color successGreen = Color(0xFF34A853);
  static const Color errorRed = Color(0xFFEA4335);
  static const Color warningOrange = Color(0xFFFBBC04);
  
  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryBlue,
      primaryDarkBlue,
      primaryLightBlue,
    ],
  );
  
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF0F9FF),
      Color(0xFFE0F2FE),
      Color(0xFFD1E7FF),
      Color(0xFFFFFFFF),
    ],
    stops: [0.0, 0.3, 0.7, 1.0],
  );
  
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryBlue,
      primaryDarkBlue,
      primaryLightBlue,
    ],
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFF8FAFC),
    ],
  );
  
  static const LinearGradient vibrantGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryBlue,
      accentPurple,
      accentPink,
    ],
  );
  
  static BoxShadow get softShadow => BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 20,
    offset: const Offset(0, 4),
    spreadRadius: 0,
  );
  
  static BoxShadow get mediumShadow => BoxShadow(
    color: Colors.black.withOpacity(0.12),
    blurRadius: 30,
    offset: const Offset(0, 8),
    spreadRadius: 0,
  );
  
  static BoxShadow get strongShadow => BoxShadow(
    color: Colors.black.withOpacity(0.16),
    blurRadius: 40,
    offset: const Offset(0, 12),
    spreadRadius: 0,
  );
}
