import 'dart:async';

class TimerWrapper {
  int countdownDuration = 0;
  final bool? isActive;
  Timer? timer;

  TimerWrapper({
    required this.countdownDuration,
    this.isActive,
    this.timer,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      'countdownDuration': countdownDuration,
      'isActive': isActive,
    };
  }

  factory TimerWrapper.fromJson(Map<dynamic, dynamic> json) {
    return TimerWrapper(
      countdownDuration: json['countdownDuration'] as int,
      isActive: json['isActive'] as bool?,
      timer: null,
    );
  }
}
