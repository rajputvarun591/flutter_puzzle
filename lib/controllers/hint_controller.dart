import 'package:flutter/material.dart';
import 'package:flutter_puzzle/models/puzzle.dart';

class HintController extends ChangeNotifier {
  Puzzle? puzzle;

  void performHint(Puzzle puzzle) {
    this.puzzle = puzzle;
    notifyListeners();
  }
}