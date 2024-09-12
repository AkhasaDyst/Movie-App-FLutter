import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTheme {
  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF0d253f),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.bebasNeue(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 44,
            fontWeight: FontWeight.bold,
          ),
        ),
        headlineMedium: GoogleFonts.bebasNeue(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        bodyLarge: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        bodyMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white.withOpacity(0.2),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

          ),
          elevation: 5,
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
