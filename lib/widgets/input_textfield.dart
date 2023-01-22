import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';

class InputTextFieldWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  const InputTextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.kLeftRightTopBottomPadding5h25w,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstatns.kWhite,
          border: Border.all(color: ColorConstatns.kWhite),
          borderRadius: SizesConstants.kBorderRadius12,
        ),
        child: Padding(
          padding: PaddingConstants.kLeftPadding25,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
