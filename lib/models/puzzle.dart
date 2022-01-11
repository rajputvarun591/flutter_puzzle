
class Puzzle {
  final int cardValue;
  //final Alignment alignment;

  //Puzzle(this.cardValue, this.alignment);
  Puzzle(this.cardValue);

  @override
  String toString() {
    return 'Puzzle{cardValue: $cardValue}' '\n';
  }

  // Puzzle copyWith({int? cardValue, Alignment? alignment}) {
  //   return Puzzle(
  //     cardValue = cardValue ?? this.cardValue,
  //     alignment = alignment ?? this.alignment,
  //   );
  // }
}
