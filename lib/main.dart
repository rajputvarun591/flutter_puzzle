import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_puzzle/controllers/animation_status_controller.dart';
import 'package:flutter_puzzle/controllers/drag_controller.dart';
import 'package:flutter_puzzle/controllers/hint_controller.dart';
import 'package:flutter_puzzle/controllers/order_controller.dart';
import 'package:flutter_puzzle/controllers/puzzle_controller.dart';
import 'package:flutter_puzzle/controllers/shuffle_controller.dart';
import 'package:flutter_puzzle/controllers/theme_controller.dart';
import 'package:flutter_puzzle/controllers/time_controller.dart';
import 'package:flutter_puzzle/database/hive_database.dart';
import 'package:flutter_puzzle/screens/puzzle_board.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'controllers/score_card_controller.dart';

void main() async {
  await Hive.initFlutter();
  await HiveDatabase.initDatabase();
  await Hive.openBox(HiveDatabase.scoreCardBox);
  await Hive.openBox(HiveDatabase.parentPuzzleBox);
  await Hive.openBox(HiveDatabase.boardBox);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ShuffleController>(create: (context) => ShuffleController()),
        ChangeNotifierProvider<OrderController>(create: (context) => OrderController()),
        ChangeNotifierProvider<HintController>(create: (context) => HintController()),
        ChangeNotifierProvider<ScoreCardController>(create: (context) => ScoreCardController()),
        ChangeNotifierProvider<AnimationStatusController>(create: (context) => AnimationStatusController()),
        ChangeNotifierProvider<ThemeController>(create: (context) => ThemeController()..initTheme()),
        ChangeNotifierProvider<DragController>(create: (context) => DragController()),
        ChangeNotifierProvider<TimeController>(create: (context) => TimeController()),
        ChangeNotifierProvider<PuzzleController>(
          create: (context) => PuzzleController(
            Provider.of<TimeController>(context, listen: false),
            Provider.of<ScoreCardController>(context, listen: false),
          )..initInitialCard(),
        ),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(builder: (context, themeController, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: themeController.theme,
        home: const PuzzleBoard(),
      );
    });
  }
}
