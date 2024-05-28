import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'themes.dart';

// Light theme data
ThemeData lightTheme = ThemeData.light().copyWith(
  // Customize app bar theme
  appBarTheme: const AppBarTheme(
    // Set status bar brightness to light
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  // Customize color scheme
  colorScheme: ThemeData.light().colorScheme.copyWith(
        secondary: const Color(0xffa1a1a1),
        primary: const Color(0xff0F0425),
        onPrimary: const Color(0xff9694B8),
        outline: const Color(0xfff0f0f0),
        onSurface: const Color(0xff0F0425),
        surface: const Color(0xffDCE8E8),
        primaryContainer: Colors.white,
        onPrimaryContainer: const Color(0xff0F0425),
      ),
  // Customize text selection theme
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  // Set scaffold background color
  scaffoldBackgroundColor: Colors.white,
  // Customize progress indicator theme
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor: Color(0xffECEAEA), color: ThemeConfig.primaryColor),
  primaryColor: ThemeConfig.primaryColor,
  // Customize radio theme
  radioTheme: RadioThemeData(
    fillColor:
        WidgetStateColor.resolveWith((states) => Colors.black.withOpacity(.4)),
  ),
  // Customize text theme
  textTheme: ThemeData.light().textTheme.copyWith(
        titleMedium: GoogleFonts.roboto(color: Colors.black),
        titleSmall: GoogleFonts.roboto(color: Colors.black.withOpacity(.3)),
        displayLarge: GoogleFonts.roboto(color: Colors.black),
        displayMedium: GoogleFonts.roboto(
            color: Colors.black, fontWeight: FontWeight.w400),
        headlineMedium: GoogleFonts.roboto(color: ThemeConfig.textColor6B698E),
        displaySmall: GoogleFonts.roboto(
            color: Colors.black, fontWeight: FontWeight.w400),
        bodyMedium: GoogleFonts.roboto(color: ThemeConfig.textColor0F0425),
      ),
);
