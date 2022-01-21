import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_puzzle/controllers/score_card_controller.dart';
import 'package:flutter_puzzle/controllers/time_controller.dart';
import 'package:flutter_puzzle/database/hive_database.dart';
import 'package:flutter_puzzle/models/puzzle.dart';

import 'dart:developer' as developer;

import 'package:flutter_puzzle/models/score_card.dart';

class PuzzleController extends ChangeNotifier {
  static final Random random = Random();
  List<Puzzle> puzzles = [];
  late int endingCardValue;

  final TimeController timeController;
  final ScoreCardController scoreController;

  PuzzleController(this.timeController, this.scoreController);

  int moves = 0;
  int level = 1;
  int gridNumber = 3;
  bool isGameCompleted = false;

  void initCards({int? grid}) {
    puzzles.clear();
    moves = 0;

    if(grid != null) {
      gridNumber = grid;
    }

    int totalNumbers = gridNumber * gridNumber;

    List<int> values = getValues(level, totalNumbers);
    values.shuffle(random);

    for (int i = 0; i < totalNumbers; i++) {
      puzzles.add(Puzzle(values[i]));
    }
    isGameCompleted = false;
    notifyListeners();
    timeController.initValues();
    scoreController.getInitialScore(level);
    HiveDatabase().clearParentPuzzle();
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

    int ending = total * level;
    endingCardValue = ending;

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
      ScoreCard scoreCard = ScoreCard(level, moves, timeController.duration.duration, DateTime.now().toIso8601String());
      timeController.cancelStopwatch();
      scoreController.saveScore(scoreCard, level);
      isGameCompleted = true;
      notifyListeners();
      developer.log("Match Found! Game Complete");
    }
  }

  void increaseLevel() {
    level++;
    getScore();
    puzzles.clear();
    initCards();
  }

  void getScore() {
    scoreController.getScore(level);
  }

  void swapTwoChildren(Puzzle first, Puzzle last) {
    final lastIndex = puzzles.indexWhere((element) => element.cardValue == last.cardValue);
    final childIndex = puzzles.indexWhere((element) => element.cardValue == first.cardValue);

    puzzles[childIndex] = Puzzle(last.cardValue);
    puzzles[lastIndex] = Puzzle(first.cardValue);

    notifyListeners();
  }
}
