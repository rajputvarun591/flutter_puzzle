import 'package:flutter_puzzle/constants/constants.dart';
import 'package:flutter_puzzle/models/node_path.dart';
import 'package:flutter_puzzle/models/puzzle.dart';

class PathFindAlgo {
  static NodePath pathFor9(List<Puzzle> cards, int goalNodeValue, int holderNodeValue, int destinationIndex) {
    final holderNodeIndex = cards.indexWhere((element) => element.cardValue == holderNodeValue);
    final goalNodeIndex = cards.indexWhere((element) => element.cardValue == goalNodeValue);

    ///We have defined constant for each destination index value in constants
    ///so we will fetch suitable path from there according to destination index.

    int costFromGoalToDestination = getCostFor9(goalNodeIndex, destinationIndex);
    int costFromHolderToDestination = getCostFor9(holderNodeIndex, destinationIndex);

    NodePath path = NodePath(costFromGoalToDestination, costFromHolderToDestination, cards);
    return path;
  }

  static int getCostFor9(int index, int dIndex) {
    final List<int> paths = pathTables[dIndex];
    return paths[index];
  }
}
