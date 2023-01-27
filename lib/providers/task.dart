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
}
