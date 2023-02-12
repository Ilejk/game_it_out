import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/icons_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyle_constants.dart';
import 'create_a_new_task_page.dart';

class TaskPageAppBar extends StatelessWidget {
  const TaskPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstatns.kDarkGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: IconsConstants.kHolder,
          ),
          const Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Center(
              child: Text(
                StringConstants.kTaskPageTitle,
                style: TextStyleConstants.kTopBarTextStyleTitle,
              ),
            ),
          ),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: OpenContainer(
              transitionDuration: const Duration(milliseconds: 600),
              closedColor: ColorConstatns.kDarkGrey,
              middleColor: Colors.transparent,
              openColor: Colors.transparent,
              transitionType: ContainerTransitionType.fade,
              openBuilder: (context, action) {
                return CreateANewTaskPage();
              },
              closedBuilder: (context, action) {
                return IconButton(
                  onPressed: action,
                  icon: IconsConstants.kAddIcon,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
