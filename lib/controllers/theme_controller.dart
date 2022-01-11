import 'package:flutter/material.dart';
import 'package:flutter_puzzle/styles/themes.dart';

class ThemeController extends ChangeNotifier {
  ThemeData theme = normalTheme;

  bool isDarkEnabled = false;

  void changeTheme(Themes themeData) {
    theme = getTheme(themeData);
    isDarkEnabled = !isDarkEnabled;
    notifyListeners();
  }

  ThemeData getTheme(Themes themeData) {
    if (themeData == Themes.yellow) {
      return yellow;
    }
    if (themeData == Themes.red) {
      return red;
    }

    if (themeData == Themes.green) {
      return green;
    }
    if (themeData == Themes.blue) {
      return blue;
    }
    if (themeData == Themes.purple) {
      return purple;
    }
    if (themeData == Themes.dark) {
      return darkTheme;
    }
    if (themeData == Themes.grey) {
      return normalTheme;
    } else {
      return normalTheme;
    }
  }
}
