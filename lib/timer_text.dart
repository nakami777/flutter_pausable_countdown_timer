import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  final ValueNotifier<int> currentSeconds;
  final TextStyle? textStyle;

  const TimerText({
    Key? key,
    required this.currentSeconds,
    this.textStyle,
  }) : super(key: key);

  String timerString(int leftSeconds) {
    final String minutes =
        (leftSeconds / 60).floor().toString().padLeft(2, '0');
    final String seconds =
        (leftSeconds % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timerString(currentSeconds.value),
      style: textStyle,
    );
  }
}
