import 'package:flutter_puzzle/models/score_card.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

class HiveDatabase {

  HiveDatabase.internal();
  static final HiveDatabase _instance = HiveDatabase.internal();
  factory HiveDatabase() => _instance;
  
  static const scoreCardBox = "score_card_box";

  static Future<void> initDatabase() async {
    var dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(ScoreCardAdapter());
  }

  Future<void> saveScore(ScoreCard scoreCard) async {
    final box = Hive.box(scoreCardBox);
    return box.put(scoreCard.level, scoreCard);
  }

  ScoreCard? getScore(int level) {
    final box = Hive.box(scoreCardBox);
    return box.get(level) as ScoreCard?;
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