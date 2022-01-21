import 'package:flutter_puzzle/models/puzzle.dart';

class FindCardAlgo {
  static Puzzle? feasibleCard(List<Puzzle> initialCards, List<Puzzle> swappedCards, int endingCardValue) {
    for (int i = 0; i < initialCards.length; i++) {
      if (initialCards[i] != swappedCards[i]) {
        if (swappedCards[i].cardValue != endingCardValue) {
          return swappedCards[i];
        }
      }
    }
  }
}
