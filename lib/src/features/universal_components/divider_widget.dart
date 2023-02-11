import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/sizes_constants.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizesConstants.kSizedBox15height,
        Center(
          child: Container(
            height: 0.1,
            width: double.infinity,
            color: ColorConstatns.kDarkGrey,
          ),
        ),
        SizesConstants.kSizedBox15height,
      ],
    );
  }
}
