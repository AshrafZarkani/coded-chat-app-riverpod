import 'package:firebase_chat_app/config/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(
      ThemeData.light().textTheme,
    ),
    primaryColor: MyColors.primary_500,
    brightness: Brightness.light,
    primaryColorDark: MyColors.primary_500.withOpacity(0.8),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: MyColors.primary_500),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: MyColors.primary_500,
      disabledColor: MyColors.primary_500,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: MyColors.primary_500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: MyColors.greyscale_500),
      fillColor: MyColors.greyscale_100,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.greyscale_500),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.greyscale_500),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.greyscale_500),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), // Set the border radius to 10
        borderSide: const BorderSide(color: MyColors.greyscale_500),
      ),
      outlineBorder: const BorderSide(color: MyColors.greyscale_500),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.red),
      ),
    ),
  );

  static ThemeData of(BuildContext context) {
    return Theme.of(context);
  }
}
