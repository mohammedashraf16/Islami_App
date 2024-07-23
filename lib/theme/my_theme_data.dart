import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xFFB7935F);
Color primaryDarkColor = const Color(0xFF141A2E);
Color blackColor = const Color(0xFF242424);
Color yellowColor = const Color(0xFFFACC1D);

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      dividerTheme: DividerThemeData(
          color: primaryColor
      ),
      primaryColor: primaryColor,
      dividerColor: primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: blackColor,
          unselectedItemColor: Colors.white),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(size: 30, color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // titleTextStyle:ThemeDa,
      ),
      iconTheme: IconThemeData(
          color: primaryColor
      ),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: primaryColor,
          secondary: primaryColor,
          onSecondary: primaryColor,
          error: primaryColor,
          onError: primaryColor,
          background: primaryColor,
          onBackground: primaryColor,
          surface: primaryColor,
          onSurface: primaryColor),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.amiri(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: GoogleFonts.elMessiri(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ))
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      dividerColor: yellowColor,
      dividerTheme: DividerThemeData(
        color: yellowColor
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.white),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(size: 30, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // titleTextStyle:ThemeDa,
      ),
      iconTheme: IconThemeData(
        color: yellowColor
      ),

      textTheme: TextTheme(
          bodyLarge: GoogleFonts.amiri(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: GoogleFonts.elMessiri(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ))
  );
}
