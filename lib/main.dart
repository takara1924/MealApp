import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tab_screen.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.robotoTextTheme(),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(244, 131, 57, 0),
      ),
    ),
    home: const TabScreen(),
  ),
);