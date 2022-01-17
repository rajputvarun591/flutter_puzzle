import 'package:flutter/material.dart';

class OrderController extends ChangeNotifier {
  bool isOrdering = false;

  void showOrder(bool value) {
    isOrdering = value;
    notifyListeners();
  }

}