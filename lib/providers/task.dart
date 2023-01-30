import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String title;
  final String difficulty;
  final double duration;
  final double exp;

  Task({
    required this.title,
    required this.difficulty,
    required this.duration,
    required this.exp,
  });
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String,
      difficulty: json['difficulty'] as String,
      duration: json['duration'] as double,
      exp: json['exp'] as double,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'difficulty': difficulty,
      'duration': duration,
      'exp': exp,
    };
  }
}
