import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_puzzle/controllers/animation_status_controller.dart';
import 'package:flutter_puzzle/controllers/drag_controller.dart';
import 'package:flutter_puzzle/controllers/puzzle_controller.dart';
import 'package:flutter_puzzle/controllers/theme_controller.dart';
import 'package:flutter_puzzle/controllers/time_controller.dart';
import 'package:flutter_puzzle/screens/puzzle_board.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AnimationStatusController>(create: (context) => AnimationStatusController()),
        ChangeNotifierProvider<ThemeController>(create: (context) => ThemeController()),
        ChangeNotifierProvider<DragController>(create: (context) => DragController()),
        ChangeNotifierProvider<TimeController>(create: (context) => TimeController()),
        ChangeNotifierProvider<PuzzleController>(create: (context) => PuzzleController(Provider.of<TimeController>(context, listen: false))..initCards()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, themeController, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeController.theme,
          home: const PuzzleBoard(),
        );
      }
    );
  }
}
