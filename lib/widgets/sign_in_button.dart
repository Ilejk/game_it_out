import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class SignInButton extends StatelessWidget {
  final String title;

  const SignInButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: ColorConstatns.kPurpleProgressIndicator,
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
