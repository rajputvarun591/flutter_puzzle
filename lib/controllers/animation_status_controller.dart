import 'package:flutter/material.dart';

class AnimationStatusController extends ChangeNotifier {
  bool isSomeoneAnimating = false;

  void updateStatus(bool status) {
    isSomeoneAnimating = status;
    notifyListeners();
  }
}