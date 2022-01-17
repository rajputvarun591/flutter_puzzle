import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constants/constants.dart';
import 'package:flutter_puzzle/controllers/hint_controller.dart';
import 'package:flutter_puzzle/controllers/order_controller.dart';
import 'package:flutter_puzzle/controllers/puzzle_controller.dart';
import 'package:flutter_puzzle/controllers/score_card_controller.dart';
import 'package:flutter_puzzle/controllers/theme_controller.dart';
import 'package:flutter_puzzle/controllers/time_controller.dart';
import 'package:flutter_puzzle/database/hive_database.dart';
import 'package:flutter_puzzle/models/puzzle.dart';
import 'package:flutter_puzzle/models/score_card.dart';
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
                        fontSize: 18.00,
                        color: theme.textTheme.headline2!.color,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Consumer<TimeController>(builder: (context, timerController, child) {
                    return Text(
                      timerController.duration.duration,
                      style: ts20ptPoiretOneBOLD.copyWith(
                        fontSize: 18.00,
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
                        fontSize: 18.00,
                        color: theme.textTheme.headline2!.color,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Consumer<PuzzleController>(builder: (context, controller, child) {
                    return Text(
                      "${controller.moves}",
                      style: ts20ptPoiretOneBOLD.copyWith(
                        fontSize: 18.00,
                        letterSpacing: 5.00,
                        color: theme.textTheme.subtitle1!.color,
                      ),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 10.00),

            Consumer<ScoreCardController>(builder: (context, controller, child) {
              return Visibility(
                visible: controller.scoreCard != null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.00),
                  child: Row(
                    children: [
                      const RoundedIconTile(icon: Icons.wine_bar),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Best Score",
                          style: ts20ptPacificoMEDIUM.copyWith(
                            fontSize: 18.00,
                            color: theme.textTheme.headline2!.color,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Consumer<TimeController>(builder: (context, timerController, child) {
                        return Text(
                          "${controller.scoreCard?.duration.toString()} in ${controller.scoreCard?.moves.toString()}",
                          style: ts20ptPoiretOneBOLD.copyWith(
                            fontSize: 18.00,
                            color: theme.textTheme.subtitle1!.color,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),

            SafeArea(
              child: Consumer<PuzzleController>(builder: (context, puzzleController, child) {
                var puzzleCards = puzzleController.puzzles;
                var destinationChildIndex = puzzleCards.indexWhere((element) => element.cardValue == puzzleController.endingCardValue);
                var activeCards = _getActiveChild(puzzleCards, destinationChildIndex);
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
                      padding: const EdgeInsets.all(10.00),
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
                            ? InkWell(
                                onTap: _onNextTap,
                                child: Container(
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
                                        child: Text("You have Completed the Level ${puzzleController.level}",
                                            style: ts20ptPacificoREGULAR.copyWith(color: Colors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child:
                                            Text("Next Things In Development", style: ts20ptPacificoREGULAR.copyWith(color: Colors.white)),
                                      ),
                                    ],
                                  ),
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
                                    index: index,
                                    endingCardValue: puzzleController.endingCardValue,
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
            const SizedBox(height: 15.00),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedIconTile(
                    icon: Icons.shuffle,
                    onTap: _onResetTap,
                  ),
                  RoundedIconTile(
                    icon: Icons.lightbulb_outline,
                    onTap: () {},
                  ),
                  RoundedIconTile(
                    icon: Icons.check,
                    onPanDown: _onCheckDown,
                    onPanEnd: _onCheckEnd,
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

  List<Puzzle> _getActiveChild(List<Puzzle> puzzleCards, int holderIndex) {
    List<Puzzle> activeCards = [];

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
    Provider.of<PuzzleController>(context, listen: false).initCards();
  }

  void _onNextTap() {
    Provider.of<PuzzleController>(context, listen: false).increaseLevel();
  }

  void _onThemeChange(bool isDarkEnabled) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        if (Platform.isIOS) {
          return const CupertinoColorSelector();
        } else {
          return const MaterialColorSelector();
        }
      },
    );
    Provider.of<ThemeController>(context, listen: false).changeTheme(result);
  }

  // void _onHintTap() {
  //   var pro = Provider.of<PuzzleController>(context, listen: false);
  //   var puzzles = pro.puzzles;
  //   Puzzle walkablePuzzle;
  //   int currentHolderPosition = puzzles.indexWhere((element) => element.cardValue == pro.endingCardValue);
  //   List<Puzzle> activeCards = _getActiveChild(puzzles, currentHolderPosition);
  //
  //   var current1stCard = puzzles[0];
  //   var current2ndCard = puzzles[1];
  //   var current3rdCard = puzzles[2];
  //
  //   int current1stValue = pro.endingCardValue - 8;
  //   int current2ndValue = pro.endingCardValue - 7;
  //   int current3rdValue = pro.endingCardValue - 6;
  //
  //
  //
  //   if(current1stCard.cardValue == current1stValue
  //       && current2ndCard.cardValue == current2ndValue
  //       && current3rdCard.cardValue == current3rdValue) {
  //
  //   } else {
  //     if(current2ndCard.cardValue == current2ndValue) {
  //
  //     } else {
  //       if(activeCards.any((element) => element.cardValue == current2ndValue) && currentHolderPosition == 2) {
  //         walkablePuzzle = activeCards.where((element) => element.cardValue == current2ndValue).first;
  //       } else {
  //         int indexOf2ndCard = puzzles.indexWhere((element) => element.cardValue == current2ndValue);
  //         int indexToBeCleared = getIndexToBeClearedForPosition2(indexOf2ndCard, currentHolderPosition);
  //       }
  //     }
  //   }
  //   Provider.of<HintController>(context, listen: false).performHint(walkablePuzzle);
  // }

  // int getIndexToBeClearedForPosition2(int index, int currentHolderIndex) {
  //   switch(index) {
  //     case 0 : return 1;
  //     case 1 : return 2;
  //     case 3 : return 0;
  //     case 4 : return currentHolderIndex > 2 ? 1 : 5;
  //     case 5 : return 2;
  //     case 6 : return currentHolderIndex > 34 ?
  //   }
  // }


  void _onCheckDown(DragDownDetails details) {
    Provider.of<OrderController>(context, listen: false).showOrder(true);
  }

  void _onCheckEnd(DragEndDetails details) {
    Provider.of<OrderController>(context, listen: false).showOrder(false);
  }
}
