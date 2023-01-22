import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TODO: TOP BAR SAYING TASKS
        Row(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  StringConstants.kTaskPageTitle,
                  style: TextStyle(
                    color: ColorConstatns.kWhite,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                //TODO:  GO TO CREATE A NEW TASK PAGE
              },
              icon: IconsConstants.kAddIcon,
            ),
          ],
        ),
        //TODO: SCROLLABLE LIST OF TASKS
        //TODO: LIKE 10 TASKS HARDCODED
        //TODO: A TASK SHOULD HAVE AN OPTION TO BE DELETED ON SLIDE TO THE LEFT
        //TODO: OR MARKED AS DONE AND THAT SHOULD ADD APPRIOPRIATE VALUE TO THE PROGRESS BAR
        //TODO: AT THE TOP THERE SHOULD BE A PLUS ICON ALLOWING TO ADD A NEW TASK => CREATE A NEW TAST PAGE
      ],
    );
  }
}
