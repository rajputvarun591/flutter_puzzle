import 'package:flutter/material.dart';

List<Alignment> d4Aligns = [
  const Alignment(-1.0, -1.0),
  const Alignment(-0.5, -1.0),
  const Alignment(0.5, -1.0),
  const Alignment(1.0, -1.0),
  const Alignment(-1.0, -0.5),
  const Alignment(-0.5, -0.5),
  const Alignment(0.5, -0.5),
  const Alignment(1.0, -0.5),
  const Alignment(-1.0, 0.0),
  const Alignment(-0.5, 0.0),
  const Alignment(0.5, 0.0),
  const Alignment(1.0, 0.0),
  const Alignment(-1.0, 0.5),
  const Alignment(-0.5, 0.5),
  const Alignment(0.5, 0.5),
  const Alignment(1.0, 0.5),
];

List<Alignment> d3Aligns = [
  const Alignment(-1.0, -1.0),
  const Alignment(-0.0, -1.0),
  const Alignment(1.0, -1.0),
  const Alignment(-1.0, -0.0),
  const Alignment(-0.0, -0.0),
  const Alignment(1.0, -0.0),
  const Alignment(-1.0, 1.0),
  const Alignment(-0.0, 1.0),
  const Alignment(1.0, 1.0),
];

///We need to find the cost of the from the Goal Node to its Destination Node
///for finding the best destination we will follow a index structure for the current table if and only if
///destination index will be 0
///   0|1|2         0|1|2
///   3|4|5         1|2|3
///   6|7|8         2|3|4
///according to this table when destination index will be fixed for 0 value and the goal index value will be
///calculated from this table. by subtract destination index from goal index
const List<int> for0Index = [0, 1, 2, 1, 2, 3, 2, 3, 4];

///Similarly we need to construct this table for all 9 indexes
///in same manner on destination index we will put 0 and fill other places by increasing its adjacent values
///by 1
/// 1|0|1
/// 2|1|2
/// 3|2|3
const List<int> for1Index = [1, 0, 1, 2, 1, 2, 3, 2, 3];

/// For Index 2
/// 2|1|0
/// 3|2|1
/// 4|3|2
const List<int> for2Index = [2, 1, 0, 3, 2, 1, 4, 3, 2];

/// For Index 3
/// 1|2|3
/// 0|1|2
/// 1|2|3
const List<int> for3Index = [1, 2, 3, 0, 1, 2, 1, 2, 3];

/// For Index 4
/// 2|1|2
/// 1|0|1
/// 2|1|2
const List<int> for4Index = [2, 1, 2, 1, 0, 1, 2, 1, 2];

/// For Index 5
/// 3|2|1
/// 2|1|0
/// 3|2|1
const List<int> for5Index = [3, 2, 1, 2, 1, 0, 3, 2, 1];

/// For Index 6
/// 2|3|4
/// 1|2|3
/// 0|1|2
const List<int> for6Index = [2, 3, 4, 1, 2, 3, 0, 1, 2];

/// For Index 7
/// 3|2|3
/// 2|1|2
/// 1|0|1
const List<int> for7Index = [3, 2, 3, 2, 1, 2, 1, 0, 1];

/// For Index 8
/// 4|3|2
/// 3|2|1
/// 2|1|0
const List<int> for8Index = [4, 3, 2, 3, 2, 1, 2, 1, 0];

///Now we will combine all these tables in a final list so that we can get exact table
///by passing the destination index
///
const List<List<int>> pathTables = [
  for0Index,
  for1Index,
  for2Index,
  for3Index,
  for4Index,
  for5Index,
  for6Index,
  for7Index,
  for8Index,
];

class Board {
  static const String currentLevel = "current_level";
  static const String currentTheme = "current_theme";
  static const String goalNode = "goal_node";
}
