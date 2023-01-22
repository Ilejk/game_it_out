import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';

import '../constants/color_constants.dart';

class SignInButton extends StatelessWidget {
  final String title;

  const SignInButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizesConstants.kSignInButtonWidth,
      height: SizesConstants.kSignInButtonHeight,
      decoration: BoxDecoration(
        color: ColorConstatns.kPurple,
        borderRadius: SizesConstants.kBorderRadius12,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: ColorConstatns.kWhite,
            fontWeight: FontWeight.bold,
            fontSize: SizesConstants.kSignInButtonFontSize,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
