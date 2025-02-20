import 'package:flutter/material.dart';

import 'constants.dart';

final theme = ThemeData(
  useMaterial3: false,
  fontFamily: AppFonts.lemon,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.accent,
    selectionColor: AppColors.accent,
    selectionHandleColor: AppColors.accent,
  ),
  colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.bg),
  scaffoldBackgroundColor: AppColors.bg,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 12,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: AppColors.accent,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    hintStyle: TextStyle(
      color: AppColors.hint,
      fontSize: 16,
      fontFamily: AppFonts.bold,
    ),
  ),
);
