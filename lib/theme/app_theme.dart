import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Luminos Palette
  static const Color primaryColor = Color(0xFF6C4FD6);
  static const Color secondaryColor = Color(0xFF1ECBA8);
  static const Color accentColor = Color(0xFFF5A623);
  static const Color backgroundColor = Color(0xFF0D0B1A);
  static const Color cardColor = Color(0xFF1A1830);
  static const Color textPrimaryColor = Color(0xFFF0EEF8);
  static const Color textSecondaryColor = Color(0xFF7B7A9A);
  static const Color borderColor = Color(0xFF2E2B4A);
  static const Color errorColor = Color(0xFFE8415A);
  static const Color successColor = Color(0xFF1ECBA8);

  // ───── LIGHT THEME ─────
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F3FF),
    primaryColor: primaryColor,

    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: accentColor,
      surface: Color(0xFFFFFFFF),
      error: errorColor,
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF04342C),
      onSurface: Color(0xFF1A1830),
    ),

    cardColor: const Color(0xFFFFFFFF),
    dividerColor: const Color(0xFFE2DEFF),

    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headlineLarge: const TextStyle(
        color: textPrimaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: const TextStyle(
        color: textPrimaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textPrimaryColor,
      ),
      bodyLarge: const TextStyle(
        color: textSecondaryColor,
        fontSize: 16,
      ),
      bodyMedium: const TextStyle(
        color: textSecondaryColor,
        fontSize: 14,
      ),
    ),

    extensions: const [
      LuminosColors(success: successColor),
    ],
  );

  // ───── DARK THEME ─────
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,

    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: accentColor,
      surface: cardColor,
      error: errorColor,
      onPrimary: Color(0xFFEDE9FF),
      onSecondary: Color(0xFF04342C),
      onSurface: textPrimaryColor,
    ),

    cardColor: cardColor,
    dividerColor: borderColor,

    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyLarge: const TextStyle(
        color: textPrimaryColor,
        fontSize: 16,
      ),
      bodyMedium: const TextStyle(
        color: textSecondaryColor,
        fontSize: 14,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      iconTheme: IconThemeData(
        color: textPrimaryColor,
      ),
      actionsIconTheme: IconThemeData(
        color: textPrimaryColor,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((12))
      ),
      textStyle: GoogleFonts.poppins( fontSize: 16,
      fontWeight: FontWeight.w600)
      
      )
    )

    extensions: const [
      LuminosColors(success: successColor),
    ],
  );
}

// ───── Theme Extension ─────
class LuminosColors extends ThemeExtension<LuminosColors> {
  final Color success;

  const LuminosColors({required this.success});

  @override
  LuminosColors copyWith({Color? success}) {
    return LuminosColors(success: success ?? this.success);
  }

  @override
  LuminosColors lerp(LuminosColors? other, double t) {
    if (other == null) return this;
    return LuminosColors(
      success: Color.lerp(success, other.success, t)!,
    );
  }
}