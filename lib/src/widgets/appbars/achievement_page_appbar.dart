import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyle_constants.dart';

class AchievementPageAppBar extends StatelessWidget {
  const AchievementPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: SizesConstants.kTopBarRadius,
      child: Container(
        color: ColorConstatns.kDarkGrey,
        child: Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    StringConstants.kAchievement,
                    style: TextStyleConstants.kTopBarTextStyleTitle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
