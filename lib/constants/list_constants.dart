import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';

class ListConstants {
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
}
