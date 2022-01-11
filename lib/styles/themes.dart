import 'package:flutter/material.dart';

ThemeData get darkTheme => ThemeData(
      scaffoldBackgroundColor: const Color(0xFF333333),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white70),
        headline2: TextStyle(color: Colors.white70),
        bodyText1: TextStyle(color: Colors.white70),
        subtitle1: TextStyle(color: Colors.white70),
      ),
      cardColor: const Color(0xFF4d4d4d),
      backgroundColor: const Color(0xFF8c8c8c),
    );

ThemeData get normalTheme => ThemeData(
      scaffoldBackgroundColor: const Color(0xFFd9d9d9),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Color(0xFF333333)),
        bodyText1: TextStyle(color: Color(0xFF333333)),
        subtitle1: TextStyle(color: Color(0xFF333333)),
        headline2: TextStyle(color: Color(0xFF333333)),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFFFFFFFF),
        opacity: 1.0,
      ),
      cardColor: const Color(0xFFFFFFFF),
      backgroundColor: const Color(0xFF8c8c8c),
    );
