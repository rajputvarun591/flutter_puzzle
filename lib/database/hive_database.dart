import 'package:flutter_puzzle/models/puzzle.dart';
import 'package:flutter_puzzle/models/score_card.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

class HiveDatabase {

  HiveDatabase.internal();
  static final HiveDatabase _instance = HiveDatabase.internal();
  factory HiveDatabase() => _instance;
  
  static const scoreCardBox = "score_card_box";
  static const parentPuzzleBox = "parent_puzzle_box";

  static Future<void> initDatabase() async {
    var dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(ScoreCardAdapter());
    Hive.registerAdapter(PuzzleAdapter());
  }

  Future<void> saveScore(ScoreCard scoreCard) async {
    final box = Hive.box(scoreCardBox);
    return box.put(scoreCard.level, scoreCard);
  }

  ScoreCard? getScore(int level) {
    final box = Hive.box(scoreCardBox);
    return box.get(level) as ScoreCard?;
  }

  void saveParentPuzzle(List<Puzzle> card) async {
    print("Saving Puzzle " + card.toString());
    final box = Hive.box(parentPuzzleBox);
    box.clear().then((value) {
      for (var item in card) {
        box.add(item);
      }
    });
    print("Puzzle In Box0" + box.toMap().toString());
  }

  List<Puzzle> getParentPuzzle() {
    List<Puzzle> card = [];
    final box = Hive.box(parentPuzzleBox);
    print("Puzzle In Box" + box.toMap().toString());
    for(int i = 0; i < box.length; i++) {
      card.add(box.getAt(i));
    }
    return card;
  }

  Future<int> clearParentPuzzle() async {
    final box = Hive.box(parentPuzzleBox);
    return box.clear();
  }

  // void updateOrCreateScore(int level, ScoreCard scoreCard) {
  //   final box = Hive.box(scoreCardBox);
  //   var score = box.get(level) as ScoreCard?;
  //   if(score == null) {
  //     saveScore(scoreCard);
  //   } else {
  //     box.put(level, scoreCard);
  //   }
  // }
}