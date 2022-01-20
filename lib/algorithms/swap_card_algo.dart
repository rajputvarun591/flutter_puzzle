import 'package:flutter_puzzle/models/puzzle.dart';

class SwapCardAlgo {
  final Puzzle activeCard;
  final Puzzle holderCard;
  final List<Puzzle> cards;

  SwapCardAlgo(this.activeCard, this.cards, this.holderCard);

  List<Puzzle> get swappedListFor9 {
    List<Puzzle> list = cards;

    final activeCardIndex = cards.indexWhere((element) => element.cardValue == activeCard.cardValue);
    final holderCardIndex = cards.indexWhere((element) => element.cardValue == activeCard.cardValue);

    list[activeCardIndex] = Puzzle(holderCard.cardValue);
    list[holderCardIndex] = Puzzle(activeCard.cardValue);

    return list;
  }
}