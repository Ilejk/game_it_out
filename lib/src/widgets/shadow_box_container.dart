import 'package:flutter/material.dart';

import '../data/constants/color_constants.dart';
import '../data/constants/sizes_constants.dart';

class ShadowBoxContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const ShadowBoxContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ColorConstatns.kBackGroundGrey,
        border: Border.all(color: ColorConstatns.kWhite),
        borderRadius: SizesConstants.kBorderRadius12,
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
      ),
      child: child,
    );
  }
}
