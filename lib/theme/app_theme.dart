import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surfaceLight,
        onPrimary: AppColors.surfaceLight,
        onSecondary: AppColors.surfaceLight,
        onSurface: AppColors.textLight,
      ),
      scaffoldBackgroundColor: AppColors.backgroundLight,
      canvasColor: AppColors.textLight,


      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyle(
          color: AppColors.surfaceLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: AppColors.surfaceLight),
        elevation: 0,
      ),

      textTheme: TextTheme(
          bodySmall: TextStyle(color: AppColors.textLight),
          bodyMedium: TextStyle(color: AppColors.textLight),
          titleLarge: TextStyle(color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          labelLarge: TextStyle(color: AppColors.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w500)
      ),


    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.surfaceLight, backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
      ),
    ),


    // Chip-Stile
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceLight,
      labelStyle: TextStyle(color: AppColors.textLight),
      secondarySelectedColor: AppColors.primary,
      selectedColor: AppColors.secondary,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );


  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surfaceDark,
      onPrimary: AppColors.surfaceDark,
      onSecondary: AppColors.surfaceDark,
      onSurface: AppColors.textDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    canvasColor: AppColors.surfaceDark,

    // AppBar-Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        color: AppColors.surfaceDark,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.surfaceDark),
      elevation: 0,
    ),

    // Text-Theme
    textTheme: TextTheme(
      bodySmall: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
      titleLarge: TextStyle(color: AppColors.primary, fontSize: 20, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(color: AppColors.secondary, fontSize: 14, fontWeight: FontWeight.w500),
    ),

    // Button-Stile
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.surfaceDark, backgroundColor: AppColors.accent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accent,
      ),
    ),

    // Chip-Stile
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceDark,
      labelStyle: TextStyle(color: AppColors.textDark),
      secondarySelectedColor: AppColors.primary,
      selectedColor: AppColors.accent,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
