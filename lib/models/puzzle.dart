import 'package:hive/hive.dart';

part 'puzzle.g.dart';

@HiveType(typeId: 102)
class Puzzle {
  @HiveField(0)
  final int cardValue;

  Puzzle(this.cardValue);

  @override
  String toString() {
    return '$cardValue';
  }
}
