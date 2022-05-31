import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getAppTheme(BuildContext context) => ThemeData(
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      primaryColor: const Color(0xff092028),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xff092028),
        secondary: const Color(0xffd8dee1),
        secondaryContainer: const Color(0xffabb1b4),
      ),
    );
