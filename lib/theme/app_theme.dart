import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBlue,
        primary: AppColors.primaryBlue,
        secondary: AppColors.secondaryTeal,
        surface: AppColors.backgroundWhite,
        error: AppColors.errorRed,
      ),
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      
      // Typography
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.light().textTheme.copyWith(
          displayLarge: GoogleFonts.inter(
            fontSize: 72,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.1,
          ),
          displayMedium: GoogleFonts.inter(
            fontSize: 48,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
          displaySmall: GoogleFonts.inter(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            height: 1.3,
          ),
          headlineLarge: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            height: 1.3,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
          headlineSmall: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            height: 1.5,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ),
      
      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundWhite,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      
      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.textLight,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryBlue,
          side: const BorderSide(color: AppColors.primaryBlue, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryBlue,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: AppColors.backgroundWhite,
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
      ),
    );
  }
  
  // Responsive breakpoints
  static double get mobileBreakpoint => 600;
  static double get tabletBreakpoint => 960;
  static double get desktopBreakpoint => 1280;
  
  // Spacing constants
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  static const double spacingXXXL = 64.0;
}
