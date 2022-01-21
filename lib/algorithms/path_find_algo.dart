import 'package:flutter_puzzle/models/node_path.dart';
import 'package:flutter_puzzle/models/puzzle.dart';

class PathFindAlgo {
  static NodePath pathFor9(List<Puzzle> cards, int goalNodeValue, int holderNodeValue, int destinationIndex) {
    final holderNodeIndex = cards.indexWhere((element) => element.cardValue == holderNodeValue);
    final goalNodeIndex = cards.indexWhere((element) => element.cardValue == goalNodeValue);

    ///We need to find the cost of the from the Goal Node to its Destination Node
    ///for finding the best destination we will follow a index structure for the current table
    ///   0|1|2         0|1|2
    ///   3|4|5         1|2|3
    ///   6|7|8         2|3|4
    ///by this table we will assign the particular index card with the given table value so that if my goal card is
    ///on index 3 then its cost value will be by this table 1, and when we subtract goal-destination or holder-destination then we will get
    ///accurate cost of the path

    int initialCostValueForGoalNode = getCostFor9(goalNodeIndex);
    int initialCostValueForHolderNode = getCostFor9(holderNodeIndex);
    int initialCostValueForDestinationNode = getCostFor9(destinationIndex);

    int costFromGoalToDestination = initialCostValueForGoalNode == initialCostValueForDestinationNode
        ? (goalNodeIndex - destinationIndex).abs()
        : initialCostValueForGoalNode > initialCostValueForDestinationNode
          ? initialCostValueForGoalNode - initialCostValueForDestinationNode
          : ;
    int costFromHolderToDestination = initialCostValueForHolderNode == initialCostValueForDestinationNode
        ? (holderNodeIndex - destinationIndex).abs()
        : initialCostValueForHolderNode - initialCostValueForDestinationNode;

    NodePath path = NodePath(costFromGoalToDestination, costFromHolderToDestination, cards);
    return path;
  }

  static int getCostFor9(int index) {
    if (index == 0) {
      return 0;
    } else if (index == 1 || index == 3) {
      return 1;
    } else if (index == 2 || index == 4 || index == 6) {
      return 2;
    } else if (index == 5 || index == 7) {
      return 3;
    } else {
      return 4;
    }
  }
}
