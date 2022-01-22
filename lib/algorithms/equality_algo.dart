import 'package:flutter_puzzle/models/puzzle.dart';

class EqualityAlgo {
  static bool isEqual(List<Puzzle> parentList, List<Puzzle> childList) {
    List<int> parent = parentList.map((e) => e.cardValue).toList();
    List<int> child = childList.map((e) => e.cardValue).toList();

    for (int i = 0; i < parent.length; i++) {
      if (parent[i] != child[i]) {
        return false;
      }
    }
    return true;
  }

  static bool isIntEqual(List<int> parentList, List<int> childList) {
    for (int i = 0; i < parentList.length; i++) {
      if (parentList[i] != childList[i]) {
        return false;
      }
    }
    return true;
  }
}
