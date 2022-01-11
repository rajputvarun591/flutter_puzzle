import 'package:flutter/material.dart';
import 'package:flutter_puzzle/styles/themes.dart';

class ThemeController extends ChangeNotifier {

  ThemeData theme = normalTheme;

  bool isDarkEnabled = false;

  void changeTheme(ThemeData themeData) {
    theme = themeData;
    isDarkEnabled = !isDarkEnabled;
    notifyListeners();
  }
}