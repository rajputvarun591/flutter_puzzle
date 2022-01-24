import 'package:flutter_puzzle/models/puzzle.dart';

class ActiveChildAlgo {
  static List<Puzzle> activeCardsFor9(List<Puzzle> cards, int holderIndex) {
    List<Puzzle> activeCards = [];

    bool isInLeft = holderIndex == 0 || holderIndex == 3 || holderIndex == 6 || holderIndex == 9;
    bool isInMiddle = holderIndex == 1 || holderIndex == 4 || holderIndex == 7 || holderIndex == 10;
    bool isInRight = holderIndex == 2 || holderIndex == 5 || holderIndex == 8 || holderIndex == 11;

    //To detect left enable card we will minus 1 from the index of the holder card
    //and got the possible index of the left card
    int leftCardIndex = holderIndex - 1;
    //Now we will check weather this index is exist in the list or not
    if (!leftCardIndex.isNegative && cards.length > leftCardIndex && !isInLeft) {
      activeCards.add(cards[leftCardIndex]);
    }

    //Now we will find another 3 cards right(+1), top(-3), bottom(+3) adding and subtracting their respective
    //values if they exist in the list
    int rightCardIndex = holderIndex + 1;
    //Adding right possible card
    if (!rightCardIndex.isNegative && cards.length > rightCardIndex && !isInRight) {
      activeCards.add(cards[rightCardIndex]);
    }

    int topCardIndex = holderIndex - 3;
    //Adding top possible card
    if (!topCardIndex.isNegative && cards.length > topCardIndex) {
      activeCards.add(cards[topCardIndex]);
    }

    int bottomCardIndex = holderIndex + 3;
    //Adding top possible card
    if (!bottomCardIndex.isNegative && cards.length > bottomCardIndex) {
      activeCards.add(cards[bottomCardIndex]);
    }

    activeCards.sort((puzzle1, puzzle2) => puzzle1.cardValue.compareTo(puzzle2.cardValue));
    return activeCards;
  }
}
