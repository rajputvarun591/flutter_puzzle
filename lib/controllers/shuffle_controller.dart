import 'package:flutter/material.dart';

class ShuffleController extends ChangeNotifier {

  bool isSomeOneAnimating = false;

  void doAnimate() {
    notifyListeners();
  }
}