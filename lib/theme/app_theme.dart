import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color _primaryColor = const Color(0xFF0D47A1);
  static final Color _secondaryColor = const Color(0xFFFFA000);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: Colors.grey[100],
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        surface: Colors.white,
        onSurface: Colors.black87,
        onSurfaceVariant: Colors.grey[600]!,
        tertiary: Colors.teal,
        onTertiary: Colors.white,
        outline: Colors.grey[300]!,
      ),
      textTheme: GoogleFonts.latoTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static Color getTrailDifficultyColor(String difficulty, {required bool isLight}) {
    difficulty = difficulty.toLowerCase();
    if (difficulty == 'easy') return Colors.green;
    if (difficulty == 'moderate') return Colors.orange;
    if (difficulty == 'difficult') return Colors.red;
    return Colors.grey;
  }
}