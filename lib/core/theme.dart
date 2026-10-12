import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color textDark = Color(0xFF000000);
  static const Color white = Color(0xFFFBFBFB);
  static const Color khaki = Color(0xFFCBB88D);
  static const Color darkgreen = Color(0xFF133125);
  static const Color lightgreen = Color(0xFFD7F1E0);
  static const Color whiteGreen = Color(0xFFF0F9F8);
  static const LinearGradient sidebarGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1B6329),
      Color(0xFF0D120D),
    ],
  );
}

class AppTextStyles {
  // Heading 1 - 48
  static TextStyle heading1 = GoogleFonts.lato(
    fontSize: 48,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  // Heading 2 - 32
  static TextStyle heading2 = GoogleFonts.lato(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  // Heading 2 Bold - 32
  static TextStyle heading2Bold = GoogleFonts.lato(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  // Heading 3 - 24
  static TextStyle heading3 = GoogleFonts.lato(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  // Heading 3 - 24
  static TextStyle heading3Bold = GoogleFonts.lato(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  // Sub Heading - 20
  static TextStyle subHeading = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  // Sub Heading Bold - 20
  static TextStyle subHeadingBold = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  // Body - 16
  static TextStyle body = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  // Body Bold - 16
  static TextStyle bodyBold = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  // Sub Body - 12
  static TextStyle subBody = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );
}

