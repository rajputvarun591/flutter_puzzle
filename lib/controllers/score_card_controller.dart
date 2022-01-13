import 'package:flutter/cupertino.dart';
import 'package:flutter_puzzle/database/hive_database.dart';
import 'package:flutter_puzzle/models/score_card.dart';

class ScoreCardController extends ChangeNotifier {
  ScoreCard? scoreCard;
  HiveDatabase database = HiveDatabase();

  void getScore(int level) {
    scoreCard = database.getScore(level);
    //notifyListeners();
  }

  void saveScore(ScoreCard score, int level) async {
    await database.saveScore(score).then((value) {
      scoreCard = database.getScore(level);
      notifyListeners();
    });
  }

}