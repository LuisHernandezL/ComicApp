import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

theme(ColorScheme colorScheme) {
  return ThemeData(
    snackBarTheme: SnackBarThemeData(
      backgroundColor: colorScheme.surface,
      contentTextStyle: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      actionTextColor: colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    scaffoldBackgroundColor: colorScheme.surface,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: colorScheme.onSurface,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      actionsIconTheme: IconThemeData(
        color: colorScheme.onSurface,
      ),
    ),
  );
}
