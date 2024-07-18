import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerContainer extends StatefulWidget {
  const TimerContainer({super.key});

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) =>
        log('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
  }

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _stopWatchTimer.onStartTimer();
      } else {
        _stopWatchTimer.onStopTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime = StopWatchTimer.getDisplayTime(value,
                    hours: false,
                    minute: true,
                    second: true,
                    milliSecond: false);
                return Text(
                  displayTime,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            InkWell(
                onTap: _toggleTimer,
                child: Icon(
                  _isRunning ? Icons.pause : Icons.play_arrow,
                  size: 32,
                )),
          ],
        ),
      ),
    );
  }
}
