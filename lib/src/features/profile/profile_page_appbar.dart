import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyle_constants.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstatns.kDarkGrey,
      child: const Padding(
        padding: PaddingConstants.kBasePadding10,
        child: Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              StringConstants.kMyProfile,
              style: TextStyleConstants.kTopBarTextStyleTitle,
            ),
          ),
        ),
      ),
    );
  }
}
