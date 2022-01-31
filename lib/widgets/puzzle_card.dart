import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_puzzle/controllers/puzzle_controller.dart';
import 'package:flutter_puzzle/controllers/shuffle_controller.dart';
import 'package:flutter_puzzle/enums/shuffle_action.dart';
import 'package:flutter_puzzle/models/puzzle.dart';
import 'package:flutter_puzzle/styles/text_style.dart';
import 'package:provider/provider.dart';

class PuzzleCard extends StatefulWidget {
  final Puzzle puzzle;
  final int endCardValue;
  final Color color;
  const PuzzleCard({Key? key, required this.puzzle, required this.endCardValue, required this.color}) : super(key: key);

  @override
  State<PuzzleCard> createState() => _PuzzleCardState();
}

class _PuzzleCardState extends State<PuzzleCard> with SingleTickerProviderStateMixin{

  Random random = Random();

  late AnimationController animationController;
  Animation<double>? forScale;
  Animation<double>? forOpacity;
  Animation<double>? forTextOpacity;

  double opacity = 1.0;
  double opacityText = 1.0;
  double scale = 1.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    animationController.addListener(_listener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ShuffleController>(context, listen: true).addListener(() {
      if(mounted) {
        forOpacity = animationController.drive(Tween(begin: 1, end: random.nextDouble()));
        forTextOpacity = animationController.drive(Tween(begin: 1, end: 0));
        forScale = animationController.drive(Tween(begin: 1, end: random.nextDouble()));
        animationController.forward().then((value) {
          var pro = Provider.of<ShuffleController>(context, listen: false);
          if (pro.shuffleAction == ShuffleAction.noChange && widget.puzzle.cardValue == widget.endCardValue && !pro.isSomeOneAnimating) {
            Provider.of<PuzzleController>(context, listen: false).initCards();
          }
          if (pro.shuffleAction == ShuffleAction.increase && widget.puzzle.cardValue == widget.endCardValue && !pro.isSomeOneAnimating) {
            Provider.of<PuzzleController>(context, listen: false).increaseLevel();
          }
          if (pro.shuffleAction == ShuffleAction.decrease && widget.puzzle.cardValue == widget.endCardValue && !pro.isSomeOneAnimating) {
            Provider.of<PuzzleController>(context, listen: false).decreaseLevel();
          }
          animationController.reverse();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final bool isHolder = widget.puzzle.cardValue == widget.endCardValue;
    final int length = widget.puzzle.cardValue.toString().characters.length;
    return Opacity(
      opacity: opacity,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: scale,
        child: Container(
          // width: min(size.height, size.width) * 0.25,
          // height: min(size.height, size.width) * 0.25,
          width: (size.height + size.width) * 0.0775,
          height: (size.height + size.width) * 0.0775,
          alignment: length <= 3 ? Alignment.center : Alignment.topLeft,
          decoration: BoxDecoration(
            color: isHolder ? Colors.transparent : widget.color,
          ),
          padding: const EdgeInsets.all(5.00),
          child: Visibility(
            visible: !isHolder,
            child: Opacity(
              opacity: opacityText,
              child: Text(
                "${widget.puzzle.cardValue}",
                style: ts20ptPoiretOneSEMIBOLD.copyWith(fontSize: getFontSize(length), color: theme.textTheme.headline3!.color),
              ),
            ),
          ),
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

  void _listener() {
    setState(() {
      opacity = forOpacity!.value;
      scale = forScale!.value;
      opacityText = forTextOpacity!.value;
    });
    Provider.of<ShuffleController>(context, listen: false).isSomeOneAnimating = animationController.isAnimating;
  }
}
