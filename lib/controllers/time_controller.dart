import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_puzzle/models/elapsed_duration.dart';

class TimeController extends ChangeNotifier {
  ElapsedDuration duration = ElapsedDuration("00:00");
  Timer? timer;
  Stopwatch stopwatch = Stopwatch();

  void startTimer() {
    timer ??= Timer.periodic(const Duration(seconds: 1), _timer);
    if (!stopwatch.isRunning) {
      stopwatch.start();
    }
  }

  void initValues() {
    timer = null;
    stopwatch.reset();
    duration = ElapsedDuration("00:00");
    //notifyListeners();
  }

  void _timer(Timer timer) {
    int totalSeconds = stopwatch.elapsed.inSeconds;
    int minutes = stopwatch.elapsed.inMinutes;
    int currentSeconds = totalSeconds - (minutes * 60);
    duration = ElapsedDuration(_getMinute(minutes)+":"+_getSecond(currentSeconds));
    notifyListeners();
  }

  void cancelStopwatch() {
    log("Cancelling Watch Timer");
    timer!.cancel();
    stopwatch.stop();
  }

  String _getMinute(int minutes) {
    if(minutes.toString().characters.length == 1) {
      return "0$minutes";
    } else {
      return "$minutes";
    }
  }

  String _getSecond(int second) {
    if(second.toString().characters.length == 1) {
      return "0$second";
    } else {
      return "$second";
    }
  }
}