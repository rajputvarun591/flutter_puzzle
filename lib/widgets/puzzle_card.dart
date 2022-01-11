import 'package:flutter/material.dart';
import 'package:flutter_puzzle/models/puzzle.dart';
import 'package:flutter_puzzle/styles/text_style.dart';

class PuzzleCard extends StatelessWidget {
  final Puzzle puzzle;
  final int endCardValue;
  final Color color;
  const PuzzleCard({Key? key, required this.puzzle, required this.endCardValue, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isHolder = puzzle.cardValue == endCardValue;
    return Container(
      width: size.width * 0.25,
      height: size.width * 0.25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isHolder ? Colors.transparent : color,
      ),
      child: Visibility(
        visible: !isHolder,
        child: Text(
          "${puzzle.cardValue}",
          style: ts20ptPoiretOneSEMIBOLD.copyWith(fontSize: 50.00, color: Colors.white),
        ),
      ),
    );
  }
}
