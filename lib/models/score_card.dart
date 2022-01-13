import 'package:hive/hive.dart';

part 'score_card.g.dart';

@HiveType(typeId: 101)
class ScoreCard {
  @HiveField(0)
  final int level;
  @HiveField(1)
  final int moves;
  @HiveField(2)
  final String duration;
  @HiveField(3)
  String createdAt;

  ScoreCard(this.level, this.moves, this.duration, this.createdAt);
}