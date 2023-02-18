import 'dart:async';

import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/src/features/timer/timer.dart';

class TimerWrapperAdapter extends TypeAdapter<TimerWrapper> {
  @override
  final int typeId = 2;

  @override
  TimerWrapper read(BinaryReader reader) {
    var countdownDuration = reader.read() as int;
    final isActive = reader.read() as bool;

    final timerWrapper = TimerWrapper(
      countdownDuration: countdownDuration,
      isActive: isActive,
      timer: null,
    );

    if (isActive) {
      timerWrapper.timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          timerWrapper.countdownDuration--;

          if (timerWrapper.countdownDuration <= 0) {
            timer.cancel();
          }
        },
      );
    }

    return timerWrapper;
  }

  @override
  void write(BinaryWriter writer, TimerWrapper obj) {
    writer.write(obj.countdownDuration);
    writer.write(obj.isActive);
  }
}
