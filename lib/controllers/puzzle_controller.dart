import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_puzzle/controllers/time_controller.dart';
import 'package:flutter_puzzle/models/puzzle.dart';

import 'dart:developer' as developer;

class PuzzleController extends ChangeNotifier {
  static final Random random = Random();
  List<Puzzle> puzzles = [];
  late int endingCardValue;

  final TimeController timeController;

  PuzzleController(this.timeController);

  int moves = 0;
  bool isGameCompleted = false;

  void initCards({int? level, int? gridNumber}) {
    puzzles.clear();
    moves = 0;
    gridNumber ??= 3;
    int totalNumbers = gridNumber * gridNumber;
    endingCardValue = totalNumbers;

    List<int> values = getValues(level, totalNumbers);
    values.shuffle(random);

    for (int i = 0; i < totalNumbers; i++) {
      puzzles.add(Puzzle(values[i]));
    }
    isGameCompleted = false;
    notifyListeners();
    timeController.initValues();
  }

  void swapChildren(Puzzle puzzle) {
    final holderIndex = puzzles.indexWhere((element) => element.cardValue == endingCardValue);
    final childIndex = puzzles.indexWhere((element) => element.cardValue == puzzle.cardValue);

    puzzles[childIndex] = Puzzle(endingCardValue);
    puzzles[holderIndex] = Puzzle(puzzle.cardValue);

    notifyListeners();
    startTimerWithMoves();
    checkForEnd();
  }

  List<int> getValues(int? level, int total) {
    List<int> numbers = [];
    level ??= 1;

    int ending = total * level; // 27

    for (int i = 0; i < total; i++) {
      numbers.add(ending - i);
    }
    return numbers;
  }

  void startTimerWithMoves() {
    moves++;
    notifyListeners();
    timeController.startTimer();
  }

  void checkForEnd() {
    List<int> currentList = puzzles.map((e) => e.cardValue).toList();
    List<int> sortedList = puzzles.map((e) => e.cardValue).toList();
    sortedList.sort();

    List<bool> isEqual = [];
    for (int i = 0; i < sortedList.length; i++) {
      if (sortedList[i] == currentList[i]) {
        isEqual.add(true);
      } else {
        isEqual.add(false);
      }
    }

    if (isEqual.any((e) => e == false)) {
      developer.log("Match Not Found!");
    } else {
      timeController.cancelStopwatch();
      isGameCompleted = true;
      notifyListeners();
      developer.log("Match Found! Game Complete");
    }
  }
}
