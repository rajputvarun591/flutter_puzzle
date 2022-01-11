import 'package:flutter/material.dart';

ThemeData get darkTheme => ThemeData(
      scaffoldBackgroundColor: const Color(0xFF333333),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Color(0xFFe6e6e6)),
        headline2: TextStyle(color: Color(0xFFe6e6e6)),
        headline3: TextStyle(color: Color(0xFFe6e6e6)),
        bodyText1: TextStyle(color: Color(0xFFe6e6e6)),
        subtitle1: TextStyle(color: Color(0xFFe6e6e6)),
      ),
      cardColor: const Color(0xFF4d4d4d),
      backgroundColor: const Color(0xFF333333),
      iconTheme: const IconThemeData(
        color: Color(0xFFe6e6e6),
        opacity: 7.0,
      ),
    );

ThemeData get normalTheme => ThemeData(
      scaffoldBackgroundColor: const Color(0xFFd9d9d9),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Color(0xFF333333)),
        bodyText1: TextStyle(color: Color(0xFF333333)),
        subtitle1: TextStyle(color: Color(0xFF333333)),
        headline2: TextStyle(color: Color(0xFF333333)),
        headline3: TextStyle(color: Color(0xFFe6e6e6)),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFFFFFFFF),
        opacity: 1.0,
      ),
      cardColor: const Color(0xFFFFFFFF),
      backgroundColor: const Color(0xFF8c8c8c),
    );

ThemeData get yellow => ThemeData(
  scaffoldBackgroundColor: Colors.yellow.shade100,
  textTheme: const TextTheme(
    headline1: TextStyle(color: Color(0xFF333333)),
    bodyText1: TextStyle(color: Color(0xFF333333)),
    subtitle1: TextStyle(color: Color(0xFF333333)),
    headline2: TextStyle(color: Color(0xFF333333)),
    headline3: TextStyle(color: Color(0xFF333333)),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF333333),
    opacity: 1.0,
  ),
  cardColor: const Color(0xFFFFFFFF),
  backgroundColor: Colors.yellow,
);

ThemeData get red => ThemeData(
  scaffoldBackgroundColor: Colors.red.shade100,
  textTheme: const TextTheme(
    headline1: TextStyle(color: Color(0xFF333333)),
    bodyText1: TextStyle(color: Color(0xFF333333)),
    subtitle1: TextStyle(color: Color(0xFF333333)),
    headline2: TextStyle(color: Color(0xFF333333)),
    headline3: TextStyle(color: Color(0xFFFFFFFF)),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFFFFFFFF),
    opacity: 1.0,
  ),
  cardColor: const Color(0xFFFFFFFF),
  backgroundColor: Colors.red,
);

ThemeData get green => ThemeData(
  scaffoldBackgroundColor: Colors.green.shade100,
  textTheme: const TextTheme(
    headline1: TextStyle(color: Color(0xFF333333)),
    bodyText1: TextStyle(color: Color(0xFF333333)),
    subtitle1: TextStyle(color: Color(0xFF333333)),
    headline2: TextStyle(color: Color(0xFF333333)),
    headline3: TextStyle(color: Color(0xFF333333)),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF333333),
    opacity: 1.0,
  ),
  cardColor: const Color(0xFFFFFFFF),
  backgroundColor: Colors.green,
);

ThemeData get blue => ThemeData(
  scaffoldBackgroundColor: Colors.blue.shade100,
  textTheme: const TextTheme(
    headline1: TextStyle(color: Color(0xFF333333)),
    bodyText1: TextStyle(color: Color(0xFF333333)),
    subtitle1: TextStyle(color: Color(0xFF333333)),
    headline2: TextStyle(color: Color(0xFF333333)),
    headline3: TextStyle(color: Color(0xFFFFFFFF)),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFFFFFFFF),
    opacity: 1.0,
  ),
  cardColor: const Color(0xFFFFFFFF),
  backgroundColor: Colors.blue,
);

ThemeData get purple => ThemeData(
  scaffoldBackgroundColor: Colors.deepPurple.shade100,
  textTheme: const TextTheme(
    headline1: TextStyle(color: Color(0xFF333333)),
    bodyText1: TextStyle(color: Color(0xFF333333)),
    subtitle1: TextStyle(color: Color(0xFF333333)),
    headline2: TextStyle(color: Color(0xFF333333)),
    headline3: TextStyle(color: Color(0xFFFFFFFF)),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFFFFFFFF),
    opacity: 1.0,
  ),
  cardColor: const Color(0xFFFFFFFF),
  backgroundColor: Colors.deepPurple,
);

enum Themes {
  dark, grey, yellow, red, orange, blue, green, purple
}
