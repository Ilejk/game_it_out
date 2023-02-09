import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class GradientLinearDivider extends StatelessWidget {
  const GradientLinearDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstatns.kShadow0,
            ColorConstatns.kShadow1,
            ColorConstatns.kShadow2,
            ColorConstatns.kShadow3,
            ColorConstatns.kShadow4,
            ColorConstatns.kShadow5,
            ColorConstatns.kShadow6,
          ],
        ),
      ),
    );
  }
}
