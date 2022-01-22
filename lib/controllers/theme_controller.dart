import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constants/constants.dart';
import 'package:flutter_puzzle/database/hive_database.dart';
import 'package:flutter_puzzle/styles/themes.dart';

class ThemeController extends ChangeNotifier {
  ThemeData theme = yellow;


  void initTheme() {
    final value = HiveDatabase().getBoardValue(Board.currentTheme);
    if(value != null) {
      theme = getTheme(value);
    }
  }

  void changeTheme(Themes themeData) {
    theme = getTheme(themeData.index);
    HiveDatabase().saveBoardValue(Board.currentTheme, themeData.index);
    notifyListeners();
  }

  ThemeData getTheme(int themeData) {
    if (themeData == Themes.yellow.index) {
      return yellow;
    }
    if (themeData == Themes.red.index) {
      return red;
    }

    if (themeData == Themes.green.index) {
      return green;
    }
    if (themeData == Themes.blue.index) {
      return blue;
    }
    if (themeData == Themes.purple.index) {
      return purple;
    }
    if (themeData == Themes.dark.index) {
      return darkTheme;
    }
    if (themeData == Themes.grey.index) {
      return normalTheme;
    } else {
      return normalTheme;
    }
  }
}
