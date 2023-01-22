import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';

class SquareTileButtonLogo extends StatelessWidget {
  final String imageId;
  final Function()? onTap;

  const SquareTileButtonLogo(
      {super.key, required this.onTap, required this.imageId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizesConstants.kSquareTileButtonHeight,
        width: SizesConstants.kSquareTileButtonWidth,
        decoration: BoxDecoration(
          color: ColorConstatns.kWhite,
          borderRadius: SizesConstants.kBorderRadius12,
        ),
        child: Padding(
          padding: PaddingConstants.kBasePadding8,
          child: Image.asset(imageId),
        ),
      ),
    );
  }
}
