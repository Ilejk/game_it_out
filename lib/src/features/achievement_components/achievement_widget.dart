import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/textstyle_constants.dart';

// ignore: must_be_immutable
class AchievementWidget extends StatelessWidget {
  String achievementTitle;
  String achievementDescription;
  bool isFinishedStatus;

  AchievementWidget({
    Key? key,
    required this.achievementTitle,
    required this.achievementDescription,
    required this.isFinishedStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.kBasePadding10,
      child: ClipRRect(
        borderRadius: SizesConstants.kBorderRadius12,
        child: Container(
          width: double.infinity,
          color: ColorConstatns.kBackGroundGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: Text(
                      achievementTitle,
                      style: TextStyleConstants.kTaskTitleTextStyle,
                    ),
                  ),
                  Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: Text(
                      achievementDescription,
                      style: TextStyleConstants.kTaskSubTitleTextStyle,
                    ),
                  )
                ],
              ),
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Icon(
                  isFinishedStatus
                      ? IconsConstants.kTaskFinished
                      : IconsConstants.kToDo,
                  color: isFinishedStatus
                      ? ColorConstatns.kGreen
                      : ColorConstatns.kRed,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
