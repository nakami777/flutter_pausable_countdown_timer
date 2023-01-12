import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_pausable_countdown_timer/timer_text.dart';

class CountdownTimer extends HookWidget {
  final int seconds;
  final TextStyle? textStyle;
  final void Function()? pauseAction;
  final void Function()? restartAction;
  final void Function()? finishAction;

  const CountdownTimer({
    Key? key,
    required this.seconds,
    this.textStyle,
    this.pauseAction,
    this.restartAction,
    this.finishAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();

    final ValueNotifier<int> currentSeconds = useState<int>(seconds);
    final ValueNotifier<Timer?> timer = useState<Timer?>(null);

    Timer countTimer() {
      return Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          currentSeconds.value--;

          if (!isMounted()) return;

          if (currentSeconds.value < 1) {
            finishAction;
            timer.cancel();
            return;
          }
        },
      );
    }

    void pause() {
      timer.value?.cancel();
      if (pauseAction != null) pauseAction!();
    }

    void restart() {
      timer.value = countTimer();
      if (restartAction != null) restartAction!();
    }

    useEffect(
      () {
        timer.value = countTimer();
        return () {
          timer.value?.cancel();
          currentSeconds.dispose();
        };
      },
      const [],
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (timer.value?.isActive != null) {
          timer.value!.isActive ? pause() : restart();
        }
      },
      child: TimerText(
        currentSeconds: currentSeconds,
        textStyle: textStyle,
      ),
    );
  }
}
