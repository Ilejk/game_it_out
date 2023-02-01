import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';

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
        boxShadow: [
          BoxShadow(
            color: ColorConstatns.kShadownGrey500,
            blurRadius: 12,
            offset: const Offset(5, 5),
          ),
          const BoxShadow(
            color: ColorConstatns.kWhite,
            blurRadius: 12,
            offset: Offset(-5, -5),
          ),
        ],
        color: ColorConstatns.kDarkGrey,
        borderRadius: SizesConstants.kBorderRadius12,
        border: Border.all(color: ColorConstatns.kWhite),
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
