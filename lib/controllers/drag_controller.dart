import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DragController extends ChangeNotifier {
  Alignment alignment = const Alignment(0.0, 0.0);

  void changeAlignment(Alignment align) {
    alignment = align;
    //notifyListeners();
  }
}