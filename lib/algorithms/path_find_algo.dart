import 'package:flutter_puzzle/models/node_path.dart';
import 'package:flutter_puzzle/models/puzzle.dart';

class PathFindAlgo {
  final List<Puzzle> cards;
  final int goalNodeValue;
  final int holderNodeValue;
  final int destinationIndex;

  PathFindAlgo(this.cards, this.goalNodeValue, this.holderNodeValue, this.destinationIndex);

  NodePath get pathFor9 {
    final holderNodeIndex = cards.indexWhere((element) => element.cardValue == holderNodeValue);
    final goalNodeIndex = cards.indexWhere((element) => element.cardValue == goalNodeValue);

    ///We need to find the cost of the from the Goal Node to its Destination Node
    int costFromGoalToDestination;

  }
}