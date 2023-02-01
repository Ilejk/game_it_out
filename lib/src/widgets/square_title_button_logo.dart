import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';

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
          color: ColorConstatns.kBackGroundGrey,
          borderRadius: SizesConstants.kBorderRadius12,
          border: Border.all(color: ColorConstatns.kWhite),
        ),
        child: Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Image.asset(imageId),
        ),
      ),
    );
  }
}
