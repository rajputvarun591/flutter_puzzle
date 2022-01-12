import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constants/constants.dart';
import 'package:flutter_puzzle/controllers/puzzle_controller.dart';
import 'package:flutter_puzzle/controllers/theme_controller.dart';
import 'package:flutter_puzzle/controllers/time_controller.dart';
import 'package:flutter_puzzle/models/puzzle.dart';
import 'package:flutter_puzzle/styles/text_style.dart';
import 'package:flutter_puzzle/styles/themes.dart';
import 'package:flutter_puzzle/widgets/cupertino_color_selector.dart';
import 'package:flutter_puzzle/widgets/material_color_selector.dart';
import 'package:flutter_puzzle/widgets/my_grid_painter.dart';
import 'package:flutter_puzzle/widgets/puzzle_card.dart';
import 'package:flutter_puzzle/widgets/puzzle_draggable_tile.dart';
import 'package:flutter_puzzle/widgets/rounded_icon_tile.dart';
import 'package:flutter_puzzle/widgets/rounded_text_tile.dart';
import 'package:provider/provider.dart';

class PuzzleBoard extends StatefulWidget {
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  _PuzzleBoardState createState() => _PuzzleBoardState();
}

class _PuzzleBoardState extends State<PuzzleBoard> {
  // final Random random = Random();

  late int currentLevel;

  // Color get gradientColor1 => Color.fromRGBO(
  //       random.nextInt(155) + 100,
  //       random.nextInt(155) + 100,
  //       random.nextInt(155) + 100,
  //       0.5,
  //     );
  // Color get gradientColor2 => Color.fromRGBO(
  //       random.nextInt(155) + 100,
  //       random.nextInt(155) + 100,
  //       random.nextInt(155) + 100,
  //       0.5,
  //     );
  //
  // Color get color => Color.fromRGBO(
  //       Random().nextInt(200),
  //       Random().nextInt(200),
  //       Random().nextInt(200),
  //       1.0,
  //     );
  //
  // Color? tileColor;

  @override
  void initState() {
    super.initState();
    currentLevel = 1;
    //tileColor ??= color;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.00),
        // decoration: const BoxDecoration(
        //   color: Color(0xFFd9d9d9),
        //   // gradient: LinearGradient(
        //   //   colors: [gradientColor1, gradientColor2],
        //   //   begin: Alignment.topCenter,
        //   //   end: Alignment.bottomCenter,
        //   // ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const SizedBox(height: kTextTabBarHeight * 2),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Math Magic", style: ts20ptPacificoMEDIUM.copyWith(fontSize: 25.00, color: theme.textTheme.headline1!.color)),
            ),

            const SizedBox(height: kTextTabBarHeight),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.00),
              child: Row(
                children: [
                  const RoundedIconTile(icon: Icons.timer_rounded),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Time Elapsed",
                      style: ts20ptPacificoMEDIUM.copyWith(
                        color: theme.textTheme.headline2!.color,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Consumer<TimeController>(builder: (context, timerController, child) {
                    return Text(
                      timerController.duration.duration,
                      style: ts20ptPoiretOneBOLD.copyWith(
                        letterSpacing: 5.00,
                        color: theme.textTheme.subtitle1!.color,
                      ),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 10.00),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.00),
              child: Row(
                children: [
                  const RoundedIconTile(icon: Icons.grid_3x3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Moves Tried",
                      style: ts20ptPacificoMEDIUM.copyWith(
                        color: theme.textTheme.headline2!.color,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Consumer<PuzzleController>(builder: (context, controller, child) {
                    return Text(
                      "${controller.moves}",
                      style: ts20ptPoiretOneBOLD.copyWith(
                        letterSpacing: 5.00,
                        color: theme.textTheme.subtitle1!.color,
                      ),
                    );
                  }),
                ],
              ),
            ),

            // const SizedBox(height: 10.00),
            //
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.00),
            //   child: Row(
            //     children: [
            //       RoundedIconTile(color: tileColor!, icon: Icons.timer_rounded),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //         child: Text("Time Elapsed", style: ts20ptPacificoMEDIUM),
            //       ),
            //       Expanded(child: Container()),
            //       Consumer<TimeController>(builder: (context, timerController, child) {
            //         return Text(
            //           timerController.duration.duration,
            //           style: ts20ptPoiretOneBOLD.copyWith(letterSpacing: 5.00),
            //         );
            //       }),
            //     ],
            //   ),
            // ),

            SafeArea(
              child: Consumer<PuzzleController>(builder: (context, puzzleController, child) {
                var puzzleCards = puzzleController.puzzles;
                var activeCards = _getActiveChild(puzzleCards, puzzleController.endingCardValue);
                var destinationChildIndex = puzzleCards.indexWhere((element) => element.cardValue == puzzleController.endingCardValue);
                return Container(
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(8.00),
                  ),
                  child: CustomPaint(
                    painter: MyGridPainter(theme.backgroundColor.withOpacity(0.7)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.00),
                      ),
                      padding: const EdgeInsets.all(15.00),
                      height: (MediaQuery.of(context).size.width * 0.25) * 3.5,
                      width: (MediaQuery.of(context).size.width * 0.25) * 3.5,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        reverseDuration: const Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) => ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                        child: puzzleController.isGameCompleted
                            ? Container(
                                decoration: BoxDecoration(
                                  color: theme.backgroundColor,
                                ),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text("Congratulations!",
                                          style: ts20ptPacificoREGULAR.copyWith(fontSize: 25.00, color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text("You have Completed the Level $currentLevel",
                                          style: ts20ptPacificoREGULAR.copyWith(color: Colors.white)),
                                    ),
                                    ElevatedButton(
                                      onPressed: _onNextTap,
                                      style: ElevatedButton.styleFrom(
                                        primary: theme.backgroundColor,
                                        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 2.00)),
                                      ),
                                      child: const Icon(
                                        Icons.next_plan_outlined,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Stack(
                                alignment: Alignment.center,
                                fit: StackFit.passthrough,
                                children: List.generate(puzzleCards.length, (index) {
                                  bool isActiveChild = activeCards.any((element) => element.cardValue == puzzleCards[index].cardValue);
                                  return PuzzleDraggableTile(
                                    currentChild: puzzleCards[index],
                                    isActiveChild: isActiveChild,
                                    currentChildAlignment: d3Aligns[index],
                                    destinationChildAlignment: d3Aligns[destinationChildIndex],
                                    child: PuzzleCard(
                                      puzzle: puzzleCards[index],
                                      endCardValue: puzzleController.endingCardValue,
                                      color: theme.backgroundColor,
                                    ),
                                  );
                                }),
                              ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10.00),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedIconTile(
                    icon: Icons.history,
                    onTap: _onResetTap,
                  ),
                  Consumer<ThemeController>(builder: (context, themeC, child) {
                    return RoundedIconTile(
                      icon: Icons.color_lens,
                      onTap: () => _onThemeChange(themeC.isDarkEnabled),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Puzzle> _getActiveChild(List<Puzzle> puzzleCards, int endingCardValue) {
    List<Puzzle> activeCards = [];
    final holderIndex = puzzleCards.indexWhere((element) => element.cardValue == endingCardValue);

    bool isInLeft = holderIndex == 0 || holderIndex == 3 || holderIndex == 6 || holderIndex == 9;
    bool isInMiddle = holderIndex == 1 || holderIndex == 4 || holderIndex == 7 || holderIndex == 10;
    bool isInRight = holderIndex == 2 || holderIndex == 5 || holderIndex == 8 || holderIndex == 11;

    //To detect left enable card we will minus 1 from the index of the holder card
    //and got the possible index of the left card
    int leftCardIndex = holderIndex - 1;
    //Now we will check weather this index is exist in the list or not
    if (!leftCardIndex.isNegative && puzzleCards.length > leftCardIndex && !isInLeft) {
      activeCards.add(puzzleCards[leftCardIndex]);
    }

    //Now we will find another 3 cards right(+1), top(-3), bottom(+3) adding and subtracting their respective
    //values if they exist in the list
    int rightCardIndex = holderIndex + 1;
    //Adding right possible card
    if (!rightCardIndex.isNegative && puzzleCards.length > rightCardIndex && !isInRight) {
      activeCards.add(puzzleCards[rightCardIndex]);
    }

    int topCardIndex = holderIndex - 3;
    //Adding top possible card
    if (!topCardIndex.isNegative && puzzleCards.length > topCardIndex) {
      activeCards.add(puzzleCards[topCardIndex]);
    }

    int bottomCardIndex = holderIndex + 3;
    //Adding top possible card
    if (!bottomCardIndex.isNegative && puzzleCards.length > bottomCardIndex) {
      activeCards.add(puzzleCards[bottomCardIndex]);
    }

    return activeCards;
  }

  void _onResetTap() {
    Provider.of<PuzzleController>(context, listen: false).initCards(level: currentLevel);
  }

  void _onNextTap() {
    currentLevel++;
    Provider.of<PuzzleController>(context, listen: false).initCards(level: currentLevel);
  }

  void _onThemeChange(bool isDarkEnabled) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        if(Platform.isIOS) {
          return const CupertinoColorSelector();
        } else {
          return const MaterialColorSelector();
        }
      },
    );
    Provider.of<ThemeController>(context, listen: false).changeTheme(result);
  }
}
