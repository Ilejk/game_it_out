import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';

import '../constants/icons_constants.dart';
import '../constants/padding_constants.dart';
import '../constants/sizes_constants.dart';
import '../constants/string_constants.dart';
import '../constants/textstyle_constants.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
  }) : super(key: key);

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
                  'Exercise',
                  //TODO: make it changeable so it changes when with accordance what the user chooses
                  textAlign: TextAlign.left,
                  style: TextStyleConstants.kTaskTitleTextStyle,
                ),
                SizesConstants.kSizedBox15height,
                Text(
                  'Medium',
                  //TODO: make it changeable so it changes when with accordance what the user chooses
                  textAlign: TextAlign.left,
                  style: TextStyleConstants.kTaskSubTitleTextStyle,
                ),
                SizesConstants.kSizedBox15height,
                Text(
                  '${StringConstants.kDuration}  2 ${StringConstants.kHours}',
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
                  '15  ${StringConstants.kExp}',
                  //TODO: make it changeable so it changes when with accordance what the user chooses
                  style: TextStyleConstants.kTaskSubTitleTextStyle,
                ),
                SizesConstants.kSizedBox15height,
                ShadowBoxContainer(
                  height: SizesConstants.kTaskDoneIconBoxHeight,
                  width: SizesConstants.kTaskDoneIconBoxWidth,
                  child: IconButton(
                    onPressed: () {
                      //TODO : add exp to the progress bar
                    },
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
