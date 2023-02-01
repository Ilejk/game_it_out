import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login_logout_simple_ui/src/data/constants/color_constants.dart';
import '../data/constants/icons_constants.dart';
import '../data/constants/padding_constants.dart';
import '../data/constants/sizes_constants.dart';
import '../data/constants/string_constants.dart';
import '../data/constants/textstyle_constants.dart';
import 'divider_widget.dart';

class TaskWidget extends StatelessWidget {
  final String taskName;
  final String difficulty;
  final double taskLenght;
  final double expGained;
  final Function(BuildContext)? deleteTask;
  final Function(BuildContext)? taskFinished;

  const TaskWidget({
    super.key,
    required this.taskName,
    required this.difficulty,
    required this.taskLenght,
    required this.expGained,
    required this.deleteTask,
    required this.taskFinished,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.kTaskPadding,
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: SizesConstants.kBorderRadius12,
              onPressed: taskFinished,
              icon: IconsConstants.kTaskFinished,
              backgroundColor: ColorConstatns.kGreen,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: SizesConstants.kBorderRadius12,
              onPressed: deleteTask,
              icon: IconsConstants.kDelete,
              backgroundColor: ColorConstatns.kRed,
            ),
          ],
        ),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        taskName,
                        textAlign: TextAlign.left,
                        style: TextStyleConstants.kTaskTitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ),
                    ),
                    SizesConstants.kSizedBox15height,
                    Text(
                      difficulty,
                      textAlign: TextAlign.left,
                      style: TextStyleConstants.kTaskSubTitleTextStyle,
                    ),
                    SizesConstants.kSizedBox15height,
                    Text(
                      '${StringConstants.kDuration}  $taskLenght ${StringConstants.kHours}',
                      textAlign: TextAlign.left,
                      style: TextStyleConstants.kTaskSubTitleTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: PaddingConstants.kBaseTaskTilePadding,
                child: Column(
                  children: [
                    Text(
                      '$expGained  ${StringConstants.kExp}',
                      style: TextStyleConstants.kTaskSubTitleTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
