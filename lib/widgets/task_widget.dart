import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';
import '../constants/icons_constants.dart';
import '../constants/padding_constants.dart';
import '../constants/sizes_constants.dart';
import '../constants/string_constants.dart';
import '../constants/textstyle_constants.dart';

class TaskWidget extends StatelessWidget {
  final String taskName;
  final String difficulty;
  final int taskLenght;
  final Function()? onTap;
  final int expGained;

  const TaskWidget({
    super.key,
    required this.taskName,
    required this.difficulty,
    required this.taskLenght,
    required this.onTap,
    required this.expGained,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.kTaskPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  //TODO: make it changeable so it changes when with accordance what the user chooses
                  textAlign: TextAlign.left,
                  style: TextStyleConstants.kTaskTitleTextStyle,
                ),
                SizesConstants.kSizedBox15height,
                Text(
                  difficulty,
                  //TODO: make it changeable so it changes when with accordance what the user chooses
                  textAlign: TextAlign.left,
                  style: TextStyleConstants.kTaskSubTitleTextStyle,
                ),
                SizesConstants.kSizedBox15height,
                Text(
                  '${StringConstants.kDuration}  $taskLenght ${StringConstants.kHours}',
                  //TODO: make it changeable so it changes when with accordance what the user chooses
                  textAlign: TextAlign.left,
                  style: TextStyleConstants.kTaskSubTitleTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Column(
              children: [
                Text(
                  '$expGained  ${StringConstants.kExp}',
                  //TODO: make it changeable so it changes when with accordance what the user chooses
                  style: TextStyleConstants.kTaskSubTitleTextStyle,
                ),
                SizesConstants.kSizedBox15height,
                ShadowBoxContainer(
                  height: SizesConstants.kTaskDoneIconBoxHeight,
                  width: SizesConstants.kTaskDoneIconBoxWidth,
                  child: IconButton(
                    onPressed: onTap,
                    icon: IconsConstants.kDoneTaskIcon,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
