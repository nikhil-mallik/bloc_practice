import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'themes.dart';

// Dark theme data
ThemeData darkTheme = ThemeData.dark().copyWith(
  // Customize app bar theme
  appBarTheme: AppBarTheme(
    toolbarTextStyle: ThemeData.light().textTheme.displayMedium!.copyWith(
        fontFamily: ThemeConfig.pangramRegular,
        color: Colors.white,
        fontWeight: FontWeight.w500),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  // Customize text selection theme
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  // Customize text theme
  textTheme: ThemeData.dark().textTheme.copyWith(
        titleMedium: GoogleFonts.roboto(color: Colors.white),
        titleSmall: GoogleFonts.roboto(
          color: Colors.white.withOpacity(.2),
        ),
        displayLarge: GoogleFonts.roboto(color: Colors.white),
        displayMedium: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.w400),
        headlineMedium: GoogleFonts.roboto(color: ThemeConfig.textColorBCBFC2),
        displaySmall: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.w400),
        bodyMedium: GoogleFonts.roboto(color: ThemeConfig.textColorBCBFC2),
      ),
  // Customize radio theme
  radioTheme: RadioThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (states) => Colors.white.withOpacity(.3),
    ),
  ),
  // Customize color scheme
  colorScheme: const ColorScheme.dark().copyWith(
      secondary: const Color(0xff73777a),
      primary: Colors.white,
      onPrimary: const Color(0xffA0A0A0),
      outline: Colors.white,
      onSurface: const Color(0xffF6F8F8),
      brightness: Brightness.dark,
      surface: const Color(0xff202934),
      primaryContainer: const Color(0xff2d3236),
      onPrimaryContainer: const Color(0xff5a5f62)),
  // Customize progress indicator theme
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearTrackColor: Colors.white,
    color: ThemeConfig.primaryColor,
  ),
  primaryColor: ThemeConfig.primaryColor,
  scaffoldBackgroundColor: ThemeConfig.darkBackColor,
);
