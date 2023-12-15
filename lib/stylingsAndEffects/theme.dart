import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme getCustomTextTheme(BuildContext context) {
  return GoogleFonts.poppinsTextTheme(TextTheme(
      displayLarge: const TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF000080)),
      headlineMedium: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF000080)),
      headlineSmall: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      labelMedium: const TextStyle(
        fontSize: 16,
      ),
      titleMedium: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5),
      bodySmall: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
      displaySmall:
          TextStyle(fontSize: 13, color: Theme.of(context).hintColor)));
}

ThemeData getCustomThemeData(BuildContext context) {
  return ThemeData(
      textTheme: getCustomTextTheme(context),
      primaryColor: const Color(0xFF000080),
      highlightColor: const Color(0xFFFFBD59),
      hintColor: const Color(0xFF9397A0));
}
