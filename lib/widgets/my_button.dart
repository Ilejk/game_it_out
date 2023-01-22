import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class MyButton extends StatelessWidget {
  final String title;

  const MyButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: ColorConstatns.kLightPurpleText,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: ColorConstatns.kWhite,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
