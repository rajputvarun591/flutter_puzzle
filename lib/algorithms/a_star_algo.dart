import 'package:flutter_puzzle/algorithms/active_child_algo.dart';
import 'package:flutter_puzzle/algorithms/find_card_algo.dart';
import 'package:flutter_puzzle/algorithms/path_find_algo.dart';
import 'package:flutter_puzzle/algorithms/swap_card_algo.dart';
import 'package:flutter_puzzle/database/hive_database.dart';
import 'package:flutter_puzzle/models/node_path.dart';
import 'package:flutter_puzzle/models/puzzle.dart';

import 'equality_algo.dart';

class AStarAlgo {
  static Puzzle? getWalkablePuzzle(final List<Puzzle> cards, int endingCardValue) {
    ///STEP 1
    ///In Step 1 we will find out where is our holder card with which
    ///we can swipe our other cards for the solutions.
    ///we have already defined a getter for this so that we will use that one
    //holderCardIndex;
    int holderCardIndex = cards.indexWhere((element) => element.cardValue == endingCardValue);

    ///STEP 2
    ///In this Step we will find all possible moves with the card we can move and swap them
    ///with holder card
    List<Puzzle> activeCards = ActiveChildAlgo.activeCardsFor9(cards, holderCardIndex);

    ///STEP 3
    ///In this step we will find the goal value first the we will iterate each card and find out that current
    ///card is on it's position or not. if it is on it's position then we do nothing else we will find the possible
    ///paths and try to find the better one
    for (int i = 0; i < cards.length; i++) {
      var currentCard = cards[i];
      int goalValue = endingCardValue - (cards.length - (i + 1));
      if (currentCard.cardValue != goalValue) {
        ///STEP 4
        ///In this step we will construct all possible iterations by swapping active cards with the holder card
        ///and find out their possible path values for each
        List<NodePath> paths = [];

        ///STEP 5
        ///In this step we need to eliminate the Path from active Cards Path which will be having the same
        ///figure of it's parent's parent node
        ///we are using hive to save the parent Puzzle
        List<Puzzle> parentPuzzle = HiveDatabase().getParentPuzzle();

        for (Puzzle item in activeCards) {
          final List<Puzzle> swappedList = SwapCardAlgo.swappedListFor9(item, cards[holderCardIndex], cards);
          NodePath path = PathFindAlgo.pathFor9(swappedList, goalValue, endingCardValue, i);
          if (parentPuzzle.isEmpty || !EqualityAlgo.isEqual(path.respectivePuzzle, parentPuzzle)) {
            paths.add(path);
          }
        }

        ///STEP 6
        ///In this step we will add the parent puzzle for next iterations so that we can remove match
        ///puzzle from paths
        HiveDatabase().saveParentPuzzle(cards);

        List<int> pathDistances = paths.map((e) => e.goalToDestinationCost).toList();
        pathDistances.sort();

        List<NodePath> minimalPaths = paths.where((element) => element.goalToDestinationCost == pathDistances.first).toList();

        if (minimalPaths.length <= 1) {
          return FindCardAlgo.feasibleCard(cards, minimalPaths.first.respectivePuzzle, endingCardValue);
        } else {
          List<int> pathDistancesForHolder = paths.map((e) => e.holderToDestinationCost).toList();
          pathDistancesForHolder.sort();
          List<NodePath> minimalHolderPaths =
              paths.where((element) => element.holderToDestinationCost == pathDistancesForHolder.first).toList();
          return FindCardAlgo.feasibleCard(cards, minimalHolderPaths.first.respectivePuzzle, endingCardValue);
        }
      }
    }
  }
}
