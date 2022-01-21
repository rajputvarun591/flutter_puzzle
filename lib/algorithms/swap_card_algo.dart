import 'package:flutter_puzzle/models/puzzle.dart';

class SwapCardAlgo {
  static List<Puzzle> swappedListFor9(Puzzle activeCard, Puzzle holderCard, final List<Puzzle> currentCards) {
    List<Puzzle> list = [];
    list.addAll(currentCards);
    final activeCardIndex = currentCards.indexWhere((element) => element.cardValue == activeCard.cardValue);
    final holderCardIndex = currentCards.indexWhere((element) => element.cardValue == holderCard.cardValue);
    list[activeCardIndex] = Puzzle(holderCard.cardValue);
    list[holderCardIndex] = Puzzle(activeCard.cardValue);
    return list;
  }
}
