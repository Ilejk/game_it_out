import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/features/achievement_components/achievemnet.dart';
import '../features/task_components/task.dart';
import 'color_constants.dart';

class ListConstants {
  static final kGradientColorList = [
    ColorConstatns.kShadow0,
    ColorConstatns.kShadow1,
    ColorConstatns.kShadow2,
    ColorConstatns.kShadow3,
    ColorConstatns.kShadow4,
    ColorConstatns.kShadow5,
    ColorConstatns.kShadow6,
  ];
  static var kTaskBaseList = [
    Task(
      title: 'Code',
      difficulty: 'Medium',
      duration: 5.0,
      exp: 50.55,
    ),
    Task(
      title: 'Read',
      difficulty: 'Easy',
      duration: 1.0,
      exp: 10.0,
    ),
    Task(
      title: 'Go for a walk',
      difficulty: 'Easy',
      duration: 2.0,
      exp: 20.0,
    ),
    Task(
      title: 'Exercise',
      difficulty: 'Hard',
      duration: 0.5,
      exp: 15.0,
    ),
    Task(
      title: 'Study',
      difficulty: 'Medium',
      duration: 2.5,
      exp: 22.25,
    ),
    Task(
      title: 'Clean up',
      difficulty: 'Easy',
      duration: 1.0,
      exp: 10.0,
    ),
    Task(
      title: 'Cook dinner',
      difficulty: 'Easy',
      duration: 1.5,
      exp: 15.0,
    ),
    Task(
      title: 'Spend time with family',
      difficulty: 'Easy',
      duration: 1.5,
      exp: 15.0,
    ),
  ];

  static const kDurationsList = [
    DropdownMenuItem(
      value: '0.5',
      child: Text('0.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '1',
      child: Text('1 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '1.5',
      child: Text('1.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('2 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '2.5',
      child: Text('2.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '3',
      child: Text('3 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '3.5',
      child: Text('3.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '4',
      child: Text('4 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '4.5',
      child: Text('4.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '5',
      child: Text('5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '5.5',
      child: Text('5.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '6',
      child: Text('6 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '6.5',
      child: Text('6.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '7',
      child: Text('7 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '7.5',
      child: Text('7.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '8',
      child: Text('8 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '8.5',
      child: Text('8.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '9',
      child: Text('9 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '9.5',
      child: Text('9.5 ${StringConstants.kHours}'),
    ),
    DropdownMenuItem(
      value: '10',
      child: Text('10 ${StringConstants.kHours}'),
    ),
  ];
  static const kDifficultyList = [
    DropdownMenuItem(
      value: 'Easy',
      child: Text('Easy'),
    ),
    DropdownMenuItem(
      value: 'Medium',
      child: Text('Medium'),
    ),
    DropdownMenuItem(
      value: 'Hard',
      child: Text('Hard'),
    ),
  ];
  static const kMaxExpValuesList = [
    0.0,
    100.0,
    250.0,
    500.0,
    850.0,
    1000.0,
    1300.0,
    1600.0,
    2000.0,
    2400.0,
    2800.0,
    3300.0,
    3800.0,
    4400.0,
    5000.0,
    5600.0,
    6200.0,
    6900.0,
    7600.0,
    8400.0,
    9200.0,
    10000.0,
    10900.0,
    11900.0,
    12900.0,
    14000.0,
    15100.0,
    16200.0,
    17300.0,
    17500.0,
    17700.0,
    18000.0,
    20000.0,
    22000.0,
    25000.0,
    28000.0,
    31000.0,
    34000.0,
    38000.0,
    44000.0,
    48000.0,
    52000.0,
    55000.0,
    60000.0,
    65000.0,
    70000.0,
    76000.0,
    82000.0,
    89000.0,
    97000.0,
    100000.0,
  ];

  static var kAchievementList = [
    Achievement(
        title: 'Toddler',
        isFinished: false,
        description: 'Reach 200 exp',
        exp: 200,
        lvl: 3),
    Achievement(
        title: 'Tap Tap Tap',
        isFinished: false,
        description: 'Reach level 5',
        exp: 850,
        lvl: 5),
    Achievement(
        title: 'Baby steps',
        isFinished: false,
        description: 'Reach 1000 exp',
        exp: 1000,
        lvl: 6),
    Achievement(
      title: 'Creator',
      isFinished: false,
      description: 'Create 5 tasks',
      exp: 20000,
      lvl: 40,
      //TODO: somehow
    ),
    Achievement(
        title: 'Bronze membership',
        isFinished: false,
        description: 'Reach level 10',
        exp: 2400,
        lvl: 10),
    Achievement(
        title: 'Moving forward',
        isFinished: false,
        description: 'Reach 3000 exp',
        exp: 3000,
        lvl: 12),
    Achievement(
        title: 'A lover',
        isFinished: false,
        description: 'Reach level 15',
        exp: 5000,
        lvl: 15),
    Achievement(
      title: 'Inventor',
      isFinished: false,
      description: 'Create 10 new tasks',
      exp: 20000,
      lvl: 40,
      //TODO: somehow
    ),
    Achievement(
      title: 'Changed my mind',
      isFinished: false,
      description: 'Delete 10 tasks',
      exp: 20000,
      lvl: 40,
    ),
    Achievement(
        title: 'Silver membership',
        isFinished: false,
        description: 'Reach level 20',
        exp: 8400,
        lvl: 20),
    Achievement(
      title: 'A doer',
      isFinished: false,
      description: 'Complete 100 tasks',
      exp: 20000,
      lvl: 40,

      //TODO: somehow
    ),
    Achievement(
        title: 'Fast learner',
        isFinished: false,
        description: 'Reach 10000 exp',
        exp: 10000,
        lvl: 22),
    Achievement(
        title: 'Gold membership',
        isFinished: false,
        description: 'Reach level 30',
        exp: 17500,
        lvl: 30),
  ];
}
