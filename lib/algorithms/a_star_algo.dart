import 'package:flutter_puzzle/algorithms/active_child_algo.dart';
import 'package:flutter_puzzle/algorithms/path_find_algo.dart';
import 'package:flutter_puzzle/algorithms/swap_card_algo.dart';
import 'package:flutter_puzzle/models/node_path.dart';
import 'package:flutter_puzzle/models/puzzle.dart';

class AStarAlgo {
  final List<Puzzle> cards;
  final int endingCardValue;
  final int goalNodeValue;

  AStarAlgo(this.cards, this.endingCardValue, this.goalNodeValue);


  int get holderCardIndex => cards.indexWhere((element) => element.cardValue == endingCardValue);

  Puzzle getWalkablePuzzle() {
    ///STEP 1
    ///In Step 1 we will find out where is our holder card with which
    ///we can swipe our other cards for the solutions.
    ///we have already defined a getter for this so that we will use that one
    //holderCardIndex;
    ///STEP 2
    ///In this Step we will find all possible moves with the card we can move and swap them
    ///with holder card
    List<Puzzle> activeCards = ActiveChildAlgo(cards, holderCardIndex).activeCardsFor9;

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

        for(Puzzle item in activeCards) {
          List<Puzzle> swappedList = SwapCardAlgo(item, cards, cards[holderCardIndex]).swappedListFor9;
          NodePath path = PathFindAlgo(swappedList, goalValue, endingCardValue, i).pathFor9;
        }
      }
    }



  }
}