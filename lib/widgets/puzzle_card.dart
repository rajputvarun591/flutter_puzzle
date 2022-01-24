import 'dart:math';

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
    ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final bool isHolder = puzzle.cardValue == endCardValue;
    final int length = puzzle.cardValue.toString().characters.length;
    return Container(
      // width: min(size.height, size.width) * 0.25,
      // height: min(size.height, size.width) * 0.25,
      width: (size.height + size.width) * 0.0775,
      height: (size.height + size.width) * 0.0775,
      alignment: length <= 3 ? Alignment.center : Alignment.topLeft,
      decoration: BoxDecoration(
        color: isHolder ? Colors.transparent : color,
      ),
      padding: const EdgeInsets.all(5.00),
      child: Visibility(
        visible: !isHolder,
        child: Text(
          "${puzzle.cardValue}",
          style: ts20ptPoiretOneSEMIBOLD.copyWith(fontSize: getFontSize(length), color: theme.textTheme.headline3!.color),
        ),
      ),
    );
  }

  double getFontSize(int length) {
    if(length <= 3) {
      return 45.00;
    } else {
      return 35.00;
    }
  }
}
