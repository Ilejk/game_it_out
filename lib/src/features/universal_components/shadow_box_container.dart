import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/sizes_constants.dart';

class ShadowBoxContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final Color color;

  const ShadowBoxContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: ColorConstatns.kWhite),
        borderRadius: SizesConstants.kBorderRadius12,
        boxShadow: [
          BoxShadow(
            color: ColorConstatns.kMediumGrey,
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
